require_relative "../support/env"
require_relative "../utils/helpers"

class VerticalSwipingScreen < SitePrism::Page
  include Capybara::DSL
  include RSpec::Matchers
  include Helper
  data = YAML.load_file("constants/data.yml")["vertical_swipe_list"].values
  @random_framework = data[rand(data.length)]

  element :btn_vertical_swiping, :xpath, "//android.widget.TextView[@content-desc='verticalSwipe']"
  element :fld_title_vertical_swiping, :xpath, "//*[contains(@text,'Vertical swiping')]"
  element :fld_framework, :xpath, "//android.widget.TextView[@text=' #{@random_framework}']"

  def go_vertical_swiping_screen
    wait_and_tap(btn_vertical_swiping, 5)
    assert_visible(fld_title_vertical_swiping)
  end

  def perform_vertical_swiping
    c_sharp_element = driver.find_element(:xpath, "//*[@text=' C#']")

    begin
      condition_element = fld_framework.visible?
    rescue => e
      puts "The element is not visible on the screen: #{e}"
    end

    do_swipe(c_sharp_element, "screen_down") unless condition_element
    assert_visible(fld_framework)
  end
end
