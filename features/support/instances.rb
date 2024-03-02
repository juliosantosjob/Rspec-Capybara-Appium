require_relative "capy"
require_relative "../utils/helpers"

RSpec.configure do |config|
  include Helper

  config.before :each do
    # Instances of screens
    @login ||= LoginScreen.new
    @native_view ||= NativeViewScreen.new
    @slider ||= SliderScreen.new
    @vertical_swiping ||= VerticalSwipingScreen.new
    @drag_and_drop ||= DragAndDropScreen.new
    @long_press ||= LongPressScreen.new
    @carousel ||= CarouselScreen.new

    # Instances of elements
    $login_elements = Helper.load_elements("features/locators/login.yml")
    $carousel_elements = Helper.load_elements("features/locators/carousel.yml")
    $drag_and_drop_elements = Helper.load_elements("features/locators/drag_and_drop.yml")
    $long_press_elements = Helper.load_elements("features/locators/long_press.yml")
    $native_view_elements = Helper.load_elements("features/locators/native_view.yml")
    $slider_elements = Helper.load_elements("features/locators/slider.yml")
    $vertical_swiping_elements = Helper.load_elements("features/locators/vertical_swiping.yml")
  end
end
