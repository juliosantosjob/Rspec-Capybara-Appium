require_relative "../support/env"

module Helper
  def wait_for_element(locator, timeout = 5)
    wait = Selenium::WebDriver::Wait.new(timeout: timeout)

    begin
      wait.until { locator }
    rescue => e
      raise "Element not found within #{timeout} seconds. Original error: #{e.message}"
    end
  end

  def wait_and_tap(locator, timeout = 5)
    wait_for_element(locator, timeout)
    begin
      locator.click
    rescue => e
      raise "Error when clicking on element. Original error: #{e.message}"
    end
  end

  def fill_value(locator, valor)
    begin
      wait_for_element(locator)
      locator.set(valor)
    rescue => e
      puts "Error filling element. Original error: #{e.message}"
    end
  end

  def assert_visible(element)
    raise "Element is not visible." unless expect(element.visible?).to be_truthy
  end

  def assert_text(element, text)
    raise "Element text does not match expected text." unless expect(element.text).to eq(text)
  end

  def get_screen_size
    Capybara.current_session.driver.appium_driver.window_size
  end

  def move_with_drag(init_el, end_el, timeout: 2500)
    mv = Appium::TouchAction.new

    begin
      mv.long_press(element: init_el)
        .wait(timeout)
        .move_to(element: end_el)
        .release
        .perform
    rescue => e
      raise "Unable to move the element: #{e.message}"
    end
  end

  def do_swipe(element_init, direction, timeout: 2500)
    raise ArgumentError, "Enter a valid direction!" unless
      %w[
        screen_up
        screen_down
        screen_left
        screen_right
      ].include?(direction)

    init_position_x = element_init.location["x"] + element_init.size.width / 2
    init_position_y = element_init.location["y"] + element_init.size.height / 2

    case direction
    when "screen_up"
      x = element_init.location["x"] + element_init.size.width / 2
      y = get_screen_size.height

    when "screen_down"
      x = element_init.location["x"] + element_init.size.width / 2
      y = 0

    when "screen_left"
      x = 0
      y = element_init.location["y"] + element_init.size.height / 2

    when "screen_right"
      x = get_screen_size.width
      y = element_init.location["y"] + element_init.size.height / 2
    end

    Capybara.current_session.driver.swipe(
      :start_x => init_position_x,
      :start_y => init_position_y,
      :end_x => x,
      :end_y => y,
      :duration => timeout
    )
  end
end
