require_relative "../support/env"
require_relative "../utils/helpers"

class SliderScreen < SitePrism::Page
  include Capybara::DSL
  include RSpec::Matchers
  include Helper

  element :btn_slider, :xpath, "//android.widget.TextView[@content-desc='slider1']"
  element :fld_title_slider, :xpath, "//*[contains(@text,'Slider')]"
  element :slc_slider_one, :accessibility_id, "slider"

  def go_slider_screen
    wait_and_tap(btn_slider, 5)
    expect(fld_title_slider.visible?).to be_truthy
  end

  def swipe_one
    puts $driver.find_element(:accessibility_id, "slider").location.x

    # Appium::Core::TouchAction.new.press(x: 0, y: 0).wait(1000).move_to(x: 0, y: 0).release.perform
  end
end
