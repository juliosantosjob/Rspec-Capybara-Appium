require_relative "../screens/slider_screen"

RSpec.describe "Slider", :regression do
  before do
    # App authentication
    @login.go_app
    @login.fill("admin", "admin")
    @login.at_home
  end

  it "Slider - checking interaction with slider", :slider_success do
    @slider.access_slider_screen
    @slider.swipe_selector
  end
end
