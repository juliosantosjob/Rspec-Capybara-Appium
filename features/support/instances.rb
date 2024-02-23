require_relative "capy"

RSpec.configure do |config|
  ENV["HASH_USER"] = "bs://32ee29e3900e778f8c4eb5543d38382c5f94e814"
  ENV["USER_BS"] = "nametest_xUmHeN"
  ENV["USER_KEY"] = "ujyrk3C1THqy6y5WXBdW"
  ENV["RETRIES"] = 0.to_s

  config.before(:each) do
    @login ||= LoginScreen.new
    @native_view ||= NativeViewScreen.new
    @slider ||= SliderScreen.new
    @vertical_swiping ||= VerticalSwipingScreen.new
    @drag_and_drop ||= DragAndDropScreen.new
    @long_press ||= LongPressScreen.new
    @carousel ||= CarouselScreen.new
  end
end
