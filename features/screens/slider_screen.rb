require_relative "../support/env"
require_relative "../utils/helpers"

class SliderScreen < SitePrism::Page
  include Capybara::DSL
  include RSpec::Matchers
  include Helper

  element :btn_slider, :xpath, "//android.widget.TextView[@content-desc='slider1']"
  element :fld_title_slider, :xpath, "//*[contains(@text,'Slider')]"
  element :fld_end_slider, :xpath, "(//*[@text='100'])[2]"

  def access_slider_screen
    wait_and_tap(btn_slider, 5)
    assert_visible(fld_title_slider)
  end

  def swipe_one
    slider_one = Capybara.current_session.driver.appium_driver.find_element(:accessibility_id, "slider")
    do_swipe(slider_one, "screen_right")
  end

  def swipe_two
    slider_two = Capybara.current_session.driver.appium_driver.find_element(:accessibility_id, "slider1")
    do_swipe(slider_two, "screen_right")
  end

  def end_of_slide
    assert_visible(fld_end_slider)
  end
end
