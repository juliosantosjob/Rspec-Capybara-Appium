require_relative "../support/env"
require_relative "../utils/helpers"

class SliderScreen < SitePrism::Page
  include Capybara::DSL
  include RSpec::Matchers
  include Helper

  element :btn_slider, :xpath, "//android.widget.TextView[@content-desc='slider1']"
  element :fld_title_slider, :xpath, "//*[contains(@text,'Slider')]"

  def go_slider_screen
    wait_and_tap(btn_slider, 5)
    expect(fld_title_slider.visible?).to be_truthy
  end

  def swipe_one
    element = $driver.find_element(:accessibility_id, "slider")

    puts "altura: #{$driver.window_size.width}"
    puts "largura: #{$driver.window_size.height}"

    Capybara.current_session.driver.swipe(
      :start_x => element.location.x,
      :start_y => element.location.y,
      :end_x => $driver.window_size.height,
      :end_y => element.location.y,
      :duration => 2000
    )

    txt_element = find(:xpath, "(//*[contains(@text,'100')])[2]")
    expect(txt_element.visible?).to be_truthy
  end
end
