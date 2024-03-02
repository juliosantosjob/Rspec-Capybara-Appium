require_relative "../support/capy"
require_relative "../utils/helpers"

class VerticalSwipingScreen
  include Helper

  def access_vertical_swiping_screen
    find_element($vertical_swiping_elements["btn_vertical_swiping"]).click

    title = find_element($vertical_swiping_elements["fld_title_vertical_swiping"])
    expect(title.visible?).to be_truthy
  end

  def do_a_swipe_success
    frames = $vertical_swiping_elements["fld_framework"].values
    random_framework = frames.sample

    condition_element = begin
      find_element(random_framework).visible?
    rescue
      false
    end
    csharp_element = find_by_appium($vertical_swiping_elements["fld_csharp"])

    do_a_swipe({ from: csharp_element, direction: "element_from -> screen_down", timeout: 2000 }) unless condition_element
    expect(find_element(random_framework).visible?).to be_truthy
  end
end
