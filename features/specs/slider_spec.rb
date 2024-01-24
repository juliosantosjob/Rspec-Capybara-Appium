require_relative "../screens/slider_screen"

RSpec.describe "Slider", :regression, :regression_slider do
  before do
    # App authentication
    @login.go_app
    @login.fill("admin", "admin")
    @login.at_home
  end

  it "Slider - Checking first swipe", :slider_one do
    @slider.go_slider_screen
    @slider.swipe_one
    @slider.end_of_slide
  end

  it "Slider - Checking second swipe", :slider_two do
    @slider.go_slider_screen
    @slider.swipe_two
    @slider.end_of_slide
  end
end
