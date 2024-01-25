require_relative "../support/env"
require_relative "../utils/helpers"

class VerticalSwipingScreen < SitePrism::Page
  include Capybara::DSL
  include RSpec::Matchers
  include Helper

  element :btn_vertical_swiping, :xpath, "//android.widget.TextView[@content-desc='verticalSwipe']"
  element :fld_title_vertical_swiping, :xpath, "//*[contains(@text,'Vertical swiping')]"

  def go_vertical_swiping_screen
    wait_and_tap(btn_vertical_swiping, 5)
    assert_visible(fld_title_vertical_swiping)
  end

  def do_verical_swiping
    data = YAML.load_file("constants/data.yml")["vertical_swipe_list"].values
    random_framework = data[rand(data.length)]

    puts random_framework

    slider_one = $driver.find_element(:xpath, "//android.widget.TextView[@text=' #{random_framework}']")

    puts "Esta presente" unless slider_one.displayed?

    do_swipe(slider_one, "screen_down")
  end
end
