require_relative "../support/capy"
require_relative "../utils/helpers"

class SliderScreen
  include Helper

  def access_slider_screen
    find_element($slider_elements["btn_slider"]).click

    title = find_element($slider_elements["fld_title_slider"])
    expect(title.visible?).to be_truthy
  end

  def swipe_one
    slider_one = find_by_appium($slider_elements["fld_slider"])
    do_a_swipe({ from: slider_one, direction: "element_from -> screen_right", timeout: 2000 })
  end

  def swipe_two
    slider_two = find_by_appium($slider_elements["fld_slider_one"])
    do_a_swipe({ from: slider_two, direction: "element_from -> screen_right", timeout: 2000 })
  end

  def end_of_slide
    end_of_slider = find_element($slider_elements["fld_end_slider"])
    expect(end_of_slider.visible?).to be_truthy
  end
end
