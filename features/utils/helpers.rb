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

  def get_screen_size
    $driver.window_size
  end

  def do_swipe(element_init, direction, element_end: nil, timeout: 2500)
    raise ArgumentError, "Enter a valid direction" unless
      %w[
        screen_up
        screen_down
        screen_left
        screen_right
      ].include?(direction)

    # X -> horizontal   get_screen_size.width  -> largura
    # Y -> vertical     get_screen_size.height -> altura

    case direction
    when "screen_up"
      x = element_init.location["x"]
      y = element_init.location["y"]

      x_ = element_init.location["x"]
      z_ = 0
    when "screen_down"
      x = element_init.location["x"]
      y = element_init.location["y"]

      x_ = element_init.location["x"]
      z_ = get_screen_size.height
    when "screen_left"
      x = element_init.location["x"]
      y = element_init.location["y"]

      x_ = 0
      z_ = element_init.location["y"]
    when "screen_right"
      x = element_init.location["x"]
      y = element_init.location["y"]

      x_ = get_screen_size.width
      z_ = element_init.location["y"]
    else
      raise ArgumentError, "invalid direction: #{direction}"
    end

    Capybara.current_session.driver.swipe(
      :start_x => x,
      :start_y => y,
      :end_x => x_,
      :end_y => z_,
      :duration => timeout,
    )
  end
end
