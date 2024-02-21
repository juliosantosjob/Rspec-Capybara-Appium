require_relative "../support/capy"
require_relative "../support/base_screen"
require_relative "../utils/helpers"

class CarouselScreen < BaseScreen
  include Helper

  element :btn_carousel, "xpath://android.widget.TextView[@content-desc='carousel']", "locator:ios"
  element :fld_title_carousel, "xpath://android.widget.TextView[@text='Carousel - Swipe left/right']", "locator:ios"
  element :fld_view_three, "xpath://*[@text='3']", "locator:ios"

  def access_carousel_screen
    scroll_down = find_element_by_platform(
      type_and: :xpath, locator_and: "//android.widget.TextView[@content-desc='longPress']",
      type_ios: :id, locator_ios: "slider_ios",
    )

    begin
      condition_element = assert_visible(btn_carousel)
    rescue
      condition_element = false
    end

    do_a_swipe({ from: scroll_down, direction: "screen_down", timeout: 1000 }) unless condition_element

    wait_and_tap(btn_carousel, 5)
    assert_visible(fld_title_carousel)
  end

  def spin_the_carousel_ok
    views = find_element_by_platform(
      type_and: :xpath, locator_and: "//android.widget.TextView[@text='1']",
      type_ios: :id, locator_ios: "slider_ios",
    )

    do_a_swipe({ from: views, direction: "screen_right", timeout: 500 })
    assert_visible(fld_view_three)
  end
end
