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
    $driver.window_size
  end

  def do_swipe(element_init, direction, timeout: 2500)
    raise ArgumentError, "Enter a valid direction!" unless
      %w[
        screen_up
        screen_down
        screen_left
        screen_right
      ].include?(direction)

    x = element_init.location["x"]
    y = element_init.location["y"]

    case direction
    when "screen_up"
      x_ = element_init.location["x"]
      y_ = get_screen_size.height

    when "screen_down"
      x_ = element_init.location["x"]
      y_ = 0

    when "screen_left"
      x_ = 0
      y_ = element_init.location["y"]

    when "screen_right"
      x_ = get_screen_size.width
      y_ = element_init.location["y"]

    else
      raise ArgumentError, "invalid direction: #{direction}"
    end

    Capybara.current_session.driver.swipe(
      :start_x => x,
      :start_y => y,
      :end_x => x_,
      :end_y => y_,
      :duration => timeout,
    )
  end
end

# X - width - Largura
# Y - height - Altura
