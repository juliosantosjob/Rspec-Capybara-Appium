require_relative "../support/env"
require_relative "../support/hooks"

module Helper
  def wait_for_element(atribute, selector, timeout = 20)
    wait = Selenium::WebDriver::Wait.new(timeout: timeout)

    wait.until do
      @element = $driver.find_element(atribute, selector)
    end
    return @element
  end

  def find_element(attribute, selector)
    $driver.find_element(attribute, selector)
  end
end
