require_relative "capy"
require_relative "../utils/helpers"

RSpec.configure do |config|
  include Helper

  config.before :each do
    @login ||= LoginScreen.new
    @native_view ||= NativeViewScreen.new
    @slider ||= SliderScreen.new
    @vertical_swiping ||= VerticalSwipingScreen.new
    @drag_and_drop ||= DragAndDropScreen.new
    @long_press ||= LongPressScreen.new
    @carousel ||= CarouselScreen.new
  end

  config.before :each do
    $login_elements = Helper.load_elements("features/locators/login.yml")
    $carousel_elements = Helper.load_elements("features/locators/carousel.yml")
  end
end
