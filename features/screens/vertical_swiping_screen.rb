require_relative "../support/capy"
require_relative "../utils/helpers"

data = YAML.load_file("features/constants/data.yml")["technologies"].values
$random_framework = data[rand(data.length)]

class VerticalSwipingScreen < SitePrism::Page
  include Helper

  element :btn_vertical_swiping, :xpath, "//android.widget.TextView[@content-desc='verticalSwipe']"
  element :fld_title_vertical_swiping, :xpath, "//*[contains(@text,'Vertical swiping')]"
  element :fld_framework, :xpath, "//android.widget.TextView[@text=' #{$random_framework}']"

  def access_vertical_swiping_screen
    wait_and_tap(btn_vertical_swiping, 5)
    assert_visible(fld_title_vertical_swiping)
  end

  def do_swipe_success
    csharp_element = $driver.find_element :xpath, "//*[@text=' C#']"

    begin
      condition_element = fld_framework.visible?
    rescue => e
      puts "The element is not visible on the screen: #{e}"
    end

    do_swipe(csharp_element, "screen_down") unless condition_element
    assert_visible(fld_framework)
  end
end
