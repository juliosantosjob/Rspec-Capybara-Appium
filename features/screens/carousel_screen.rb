require_relative "../support/capy"
require_relative "../support/base_screen"
require_relative "../utils/helpers"

class CarouselScreen
  include Helper

  def initialize
    @carousel_elements = load_elements("features/locators/carousel.yml")
  end

  def access_carousel_screen
    scroll_down = find_element_by_appium(@carousel_elements["fld_scroll"])
    btn_carousel = find_element(@carousel_elements["btn_carousel"])

    begin
      condition_element = btn_carousel.visible? == true
    rescue
      condition_element = false
    end

    do_a_swipe({ from: scroll_down, direction: "element_from -> screen_down", timeout: 1000 }) unless condition_element
    wait_and_tap(@carousel_elements["btn_carousel"])

    fld_title = find_element(@carousel_elements["fld_title_carousel"])
    expect(fld_title.visible?).to be_truthy
  end

  def spin_the_carousel_ok
    views = find_element_by_appium(@carousel_elements["fld_views"])
    do_a_swipe({ from: views, direction: "element_from -> screen_right", timeout: 500 })

    fld_title = find_element(@carousel_elements["fld_view_three"])
    expect(fld_title.visible?).to be_truthy
  end
end
