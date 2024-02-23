require_relative "../support/capy"
require_relative "../utils/helpers"

data = YAML.load_file("features/constants/data.yml")["technologies"].values
$random_framework = data[rand(data.length)]

class VerticalSwipingScreen < BaseScreen
  include Helper

  element :btn_vertical_swiping, "xpath://android.widget.TextView[@content-desc='verticalSwipe']", "locator:ios"
  element :fld_title_vertical_swiping, "xpath://*[contains(@text,'Vertical swiping')]", "locator:ios"
  element :fld_framework, "xpath://android.widget.TextView[@text=' #{$random_framework}']", "locator:ios"

  def access_vertical_swiping_screen
    wait_and_tap(btn_vertical_swiping, 5)
    assert_visible(fld_title_vertical_swiping)
  end

  def do_a_swipe_success
    csharp_element = find_element_by_platform(
      type_and: :xpath, locator_and: "//*[@text=' C#']",
      type_ios: :id, locator_ios: "slider_ios",
    )

    begin
      condition_element = assert_visible(fld_framework)
    rescue
      condition_element = false
    end

    do_a_swipe({ from: csharp_element, direction: "element_from -> screen_down", timeout: 2000 }) unless condition_element
    assert_visible(fld_framework)
  end
end
