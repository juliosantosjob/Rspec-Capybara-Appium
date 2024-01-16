require_relative "../support/env"
require_relative "../utils/helpers"

class SliderScreen < SitePrism::Page
  include Helper

  element :btn_slider, :xpath, "//*[@content-desc='slider1']", :text => "Slider"

  def access_slider_screen
    wait_and_tap(btn_slider, 5)
  end

  def swipe_selector
    Capybara.current_session.driver.appium_driver.find_element(:accessibility_id, "slider").location

    # Capybara.current_session.driver.swipe(:start_x => 75, :start_y => 1500, :end_x => 0, :end_y => 0, :duration => 500)
    # puts slc_slider.location.x
    # puts slc_slider.location.z
    # swiping(slc_slider, second_element, timeout: 2500)
  end
end
