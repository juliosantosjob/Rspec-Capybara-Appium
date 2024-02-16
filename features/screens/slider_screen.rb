require_relative "../support/capy"
require_relative "../support/base_screen"
require_relative "../utils/helpers"

class SliderScreen < BaseScreen
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

    do_a_swipe(locator_one: slider_one, direction: "screen_right", timeout: 2000)
  end

  def swipe_two
    slider_two = find_element_by_platform(
      type_and: :accessibility_id, locator_and: "slider1",
      type_ios: :id, locator_ios: "slider_ios"
    )

    do_a_swipe(locator_one: slider_two, direction: "screen_right", timeout: 2000)
  end

  def end_of_slide
    assert_visible(fld_end_slider)
  end
end
