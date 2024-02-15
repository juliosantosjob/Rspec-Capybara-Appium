require_relative "../support/capy"
require_relative "../support/hooks"

module Helper
  def wait_for_element(locator, timeout = 10)
    init = 0
    until init == timeout
      begin
        break if locator.visible? == true
      rescue
        raise ArgumentError, "Unable to find the element #{locator} in #{timeout * 10} secs" if init == timeout - 1
      end
      init += 1
    end
  end

  def wait_and_tap(locator, timeout = 10)
    wait_for_element(locator, timeout)
    begin
      locator.click
    rescue => e
      raise ArgumentError, "Unable to click on element. Original error: #{e.message}"
    end
  end

  def fill_value(locator, text)
    begin
      wait_for_element(locator)
      locator.set(text)
    rescue => e
      raise ArgumentError, "Unable filling element. #{e.message}"
    end
  end

  def assert_visible(locator)
    raise ArgumentError, "Element is not visible." unless expect(locator.visible?).to be_truthy
  end

  def assert_text(locator, text)
    raise ArgumentError, "Element text does not match expected text." unless expect(locator.text).to eq(text)
  end

  def get_screen_size
    Capybara.current_session.driver.appium_driver.window_size
  end

  def move_with_drag(locator_one, locator_two, timeout: 2500)
    begin
      Appium::TouchAction
        .new.long_press(element: locator_one).wait(timeout).move_to(element: locator_two).release.perform
    rescue => e
      raise ArgumentError, "Unable to move the element: #{e.message}"
    end
  end

  def find_element_by_platform(**args)
    begin
      platform = ENV["PLATFORM"].downcase
      if platform.include?("android")
        return $driver.find_element(args[:type_and], args[:locator_and])
      elsif platform.include?("ios")
        return $driver.find_element(args[:type_ios], args[:locator_ios])
      else
        raise ArgumentError, "Platform not supported: #{platform}"
      end
    rescue
      raise ArgumentError, "Unable to find the element with locator: " \
      "\"#{platform.include?("android") ? args[:locator_and] : args[:locator_ios]}\""
    end
  end

  def double_tap(locator)
    begin
      Appium::TouchAction.new.tap(element: locator, count: 2).perform
    rescue => e
      raise ArgumentError, "An error occurred while performing the double tap: #{e.message}"
    end
  end

  def long_press(locator)
    begin
      Appium::TouchAction.new.long_press(element: locator).perform
    rescue => e
      raise ArgumentError, "An error occurred while performing the long press: #{e.message}"
    end
  end

  def do_a_swipe(locator_one, direction, locator_two = nil, timeout = 500)
    args_direction = %w[
      to
      screen_up
      screen_down
      screen_left
      screen_right
    ]

    raise ArgumentError, "Valid directions are: #{args_direction.join(', ')}" unless args_direction.include?(direction)

    init_position_x = locator_one.location["x"] + locator_one.size["width"] / 2
    init_position_y = locator_one.location["y"] + locator_one.size["height"] / 2

    case direction
    when "to"
      x = locator_two.location["x"] + locator_two.size["width"] / 2
      y = locator_two.location["y"] + locator_two.size["height"] / 2

    when "screen_up"
      x = locator_one.location["x"] + locator_one.size["width"] / 2
      y = get_screen_size.height

    when "screen_down"
      x = locator_one.location["x"] + locator_one.size["width"] / 2
      y = 0

    when "screen_left"
      x = 0
      y = locator_one.location["y"] + locator_one.size["height"] / 2

    when "screen_right"
      x = get_screen_size.width
      y = locator_one.location["y"] + locator_one.size["height"] / 2

    else
      raise ArgumentError, "Invalid direction '#{direction}'."
    end

    Appium::TouchAction.swipe(
      :start_x => init_position_x,
      :start_y => init_position_y,
      :end_x => x,
      :end_y => y,
      :duration => timeout
    )
  end
end
