require_relative "../support/capy"
require_relative "../utils/helpers"

class CarouselScreen
  include Helper

  def access_carousel_screen
    scroll_down = find_by_appium($carousel_elements["fld_scroll"])

    condition_element = begin
      find_element($carousel_elements["btn_carousel"]).visible?
    rescue
      false
    end

    do_a_swipe({ from: scroll_down, direction: "element_from -> screen_down", timeout: 1000 }) unless condition_element
    find_element($carousel_elements["btn_carousel"]).click

    fld_title = find_element($carousel_elements["fld_title_carousel"])
    expect(fld_title.visible?).to be_truthy
  end

  def spin_the_carousel_ok
    # views = find_by_appium($carousel_elements["fld_views"])
    fld_title = find_element($carousel_elements["fld_view_three"])

    # do_a_swipe({ from: views, direction: "element_from -> screen_right", timeout: 500 })
    expect(fld_title.visible?).to be_truthy
  end
end
