require_relative "../support/env"
require_relative "../support/hooks"

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
end
