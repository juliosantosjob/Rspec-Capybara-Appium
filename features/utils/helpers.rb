require_relative "../support/env"
require_relative "../support/hooks"

module Helper
  def wait_for_element(locator, timeout = 20)
    wait = Selenium::WebDriver::Wait.new(timeout: timeout)

    begin
      wait.until { locator }
    rescue => e
      raise "Element not found within #{timeout} seconds. Original error: #{e.message}"
    end
  end

  def wait_and_click(locator, timeout)
    wait_for_element(locator, timeout)
    begin
      locator.click
    rescue => e
      raise "Error when clicking on element. Original error: #{e.message}"
    end
  end

  def fill(locator, valor)
    begin
      locator.set(valor)
    rescue => e
      puts "Error filling element. Original error: #{e.message}"
    end
  end
end
