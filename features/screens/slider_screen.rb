require_relative "../support/env"
require_relative "../utils/helpers"

class SliderScreen < SitePrism::Page
  include Capybara::DSL
  include RSpec::Matchers
  include Helper

  element :btn_slider, :xpath, "//android.widget.TextView[@content-desc='slider1']"
  element :fld_title_slider, :xpath, "//*[contains(@text,'Slider')]"
  element :fld_end_slider, :xpath, "(//*[@text='100'])[2]"

  def go_slider_screen
    wait_and_tap(btn_slider, 5)
    expect(fld_title_slider.visible?).to be_truthy
  end

  def swipe_one
    element_slider_one = $driver.find_element(:accessibility_id, "slider")
    swipe(element_slider_one)
  end

  def swipe_two
    element_slider_two = $driver.find_element(:accessibility_id, "slider1")
    swipe(element_slider_two)
  end

  def end_of_slide
    expect(fld_end_slider.visible?).to be_truthy
  end
end
