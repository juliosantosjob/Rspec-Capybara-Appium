require_relative "../support/capy"
require_relative "../support/hooks"

module Helper
  def wait_for_element(locator, timeout = 10)
    init = 0
    until init == timeout
      begin
        break if locator.visible? == true
      rescue
        raise ArgumentError, "Unable to find the element #{elem} in #{timeout * 10} secs" if init == count - 1
      end
      init += 1
    end
  end

  def wait_and_tap(locator, timeout = 10)
    wait_for_element(locator, timeout)
    begin
      locator.click
    rescue => e
      raise "Error when clicking on element. Original error: #{e.message}"
    end
  end

  def fill_value(locator, text)
    begin
      wait_for_element(locator)
      locator.set(text)
    rescue => e
      puts "Error filling element. Original error: #{e.message}"
    end
  end

  def assert_visible(locator)
    raise "Element is not visible." unless expect(locator.visible?).to be_truthy
  end

  def assert_text(locator, text)
    raise "Element text does not match expected text." unless expect(locator.text).to eq(text)
  end

  def get_screen_size
    Capybara.current_session.driver.appium_driver.window_size
  end

  def move_with_drag(locator_one, locator_two, timeout: 2500)
    mv = Appium::TouchAction.new

    begin
      mv.long_press(element: locator_one)
        .wait(timeout)
        .move_to(element: locator_two)
        .release
        .perform
    rescue => e
      raise "Unable to move the element: #{e.message}"
    end
  end

  def find_element_by_platform(**args)
    platform = ENV["PLATFORM"].downcase
    if platform == "android"
      return $driver.find_element(*args.values_at(:type_and, :locator_and))
    elsif platform == "ios"
      return $driver.find_element(*args.values_at(:type_ios, :locator_ios))
    else
      raise "Platform not supported: #{platform}"
    end
  end

  def do_swipe(locator_one, direction, locator_two = nil, timeout = 5000)
    begin
      args_direction = %w[
        to
        screen_up
        screen_down
        screen_left
        screen_right
      ]
      raise ArgumentError, "Enter a valid direction!" unless args_direction.include?(direction)

      init_position_x = locator_one.location["x"] + locator_one.size.width / 2
      init_position_y = locator_one.location["y"] + locator_one.size.height / 2

        case direction
        when "to"
          x = locator_two.location["x"] + locator_two.size.width / 2
          y = locator_two.location["y"] + locator_two.size.height / 2

        when "screen_up"
          x = locator_one.location["x"] + locator_one.size.width / 2
          y = get_screen_size.height

        when "screen_down"
          x = locator_one.location["x"] + locator_one.size.width / 2
          y = 0

        when "screen_left"
          x = 0
          y = locator_one.location["y"] + locator_one.size.height / 2

        when "screen_right"
          x = get_screen_size.width
          y = locator_one.location["y"] + locator_one.size.height / 2
        end

      Appium::TouchAction.swipe(
        :start_x => init_position_x, :start_y => init_position_y,
        :end_x => x, :end_y => y, :duration => timeout
      )
    rescue => e
      raise "Error: Unable to swipe the element: #{e.message}"
    end
  end
end
