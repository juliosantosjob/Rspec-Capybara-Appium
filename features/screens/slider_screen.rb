require_relative "../support/capy"
require_relative "../support/base_screen"
require_relative "../utils/helpers"

class SliderScreen < BasePage
  include Helper

  element :btn_slider, "xpath://android.widget.TextView[@content-desc='slider1']", "locator:ios"
  element :fld_title_slider, "xpath://*[contains(@text,'Slider')]", "locator:ios"
  element :fld_end_slider, "xpath:(//*[@text='100'])[2]", "locator:ios"

  def access_slider_screen
    wait_and_tap(btn_slider, 5)
    assert_visible(fld_title_slider)
  end

  def swipe_one
    slider_one = find_element_by_platform(
      type_and: :accessibility_id, locator_and: "slider",
      type_ios: :id, locator_ios: "slider_ios"
    )
    do_swipe(slider_one, "screen_right")
  end

  def swipe_two
    slider_two = find_element_by_platform(
      type_and: :accessibility_id, locator_and: "slider1",
      type_ios: :id, locator_ios: "slider_ios"
    )
    do_swipe(slider_two, "screen_right")
  end

  def end_of_slide
    assert_visible(fld_end_slider)
  end
end
