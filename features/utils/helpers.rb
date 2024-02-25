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
    return Capybara.current_session.driver.appium_driver.window_size - 1
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

  def do_a_swipe(params = {})
    direction = "element_from -> screen_center"

    if params[:from]
      from = params[:from]
    else
      raise ArgumentError, "\"from\" is a required parameter for using the [do_a_swipe]."
    end

    to = params[:to] if params[:to]
    if params[:direction]
      direction = params[:direction]
    else
      raise ArgumentError, "\"direction\" is a required parameter for using the [do_a_swipe]."
    end

    dirs = direction.split("->")
    if to
      Appium::TouchAction.swipe(
        **get_options(from, dirs[0]),
        **get_options(from, to),
        duration: params[:timeout],
      )
    else
      Appium::TouchAction.swipe(
        **get_options(from, dirs[0]),
        **get_options(from, dirs[1]),
        duration: params[:timeout],
      )
    end
  end

  def get_options(anchor_element, direction)
    case direction.downcase.delete(" ")
    when "element_from"
      return {
        start_x: anchor_element.location["x"] + anchor_element.size["width"] / 2,
        start_y: anchor_element.location["y"] + anchor_element.size["height"] / 2
      }
    when "element_to"
      return {
        end_x: anchor_element.location["x"] + to.size["width"] / 2,
        end_y: anchor_element.location["y"] + to.size["height"] / 2
      }
    when "screen_center"
      return {
        end_x: get_screen_size.width / 2,
        end_y: get_screen_size.height / 2
      }
    when "screen_up"
      return {
        end_x: anchor_element.location["x"] + anchor_element.size["width"] / 2,
        end_y: get_screen_size.height
      }
    when "screen_down"
      return {
        end_x: anchor_element.location["x"] + anchor_element.size["width"] / 2,
        end_y: 0
      }
    when "screen_left"
      return {
        end_x: 0,
        end_y: anchor_element.location["y"] + anchor_element.size["height"] / 2
      }
    when "screen_right"
      return {
        end_x: get_screen_size.width,
        end_y: anchor_element.location["y"] + anchor_element.size["height"] / 2
      }
    else
      raise ArgumentError, "\"#{direction}\" direction argument is invalid."
    end
  end
end
