require_relative "../support/env"

module Helper
  # Method for waiting until a web element is present on the page
  #
  # @param locator [Element] Object to locate the web element (accessibility_id, XPath, ID, etc.).
  # @param timeout [Integer] Timeout duration in seconds. Default: 5 seconds.
  #
  # Example: wait_for_element("element_id", 5)

  def wait_for_element(locator, timeout = 5)
    wait = Selenium::WebDriver::Wait.new(timeout: timeout)

    begin
      wait.until { locator }
    rescue => e
      raise "Element not found within #{timeout} seconds. Original error: #{e.message}"
    end
  end

  # Method for waiting and tapping on a web element
  #
  # @param locator [Element] Object to locate the web element (accessibility_id, XPath, ID, etc.).
  # @param timeout [Integer] Timeout duration in seconds to wait for the element to be clickable.
  #
  # Example: wait_and_tap("button_id", 5)

  def wait_and_tap(locator, timeout = 5)
    wait_for_element(locator, timeout)
    begin
      locator.click
    rescue => e
      raise "Error when clicking on element. Original error: #{e.message}"
    end
  end

  # Method for filling a value in a web element
  #
  # @param locator [Element] Object to locate the web element (accessibility_id, XPath, ID, etc.).
  # @param value [String] Value to be filled in the identified web element.
  #
  # Example: fill_value("campo_nome", "my value")

  def fill_value(locator, valor)
    begin
      wait_for_element(locator)
      locator.set(valor)
    rescue => e
      puts "Error filling element. Original error: #{e.message}"
    end
  end

  # @param element [Capybara::Node::Element] The web element on which the swipe gesture will be performed.
  # @param timeout [Integer] (default: 2500) Duration of the swipe gesture in milliseconds.
  #
  # This method calculates the starting position (x, y) of the given web element
  # and performs a swipe gesture from that position to the right edge of the screen.
  #
  # Example:
  #   element = $driver.find_element(:xpath, "your_element_selector")
  #   swipe(element, timeout: 3000)
  #

  def swipe(element, timeout = 2500)
    postion_x = element.location.x
    postion_y = element.location.y

    screen_height = $driver.window_size.height
    # screen_width = $driver.window_size.width

    Capybara.current_session.driver.swipe(
      :start_x => postion_x,
      :start_y => postion_y,
      :end_x => screen_height,
      :end_y => postion_y,
      :duration => timeout
    )
  end
end
