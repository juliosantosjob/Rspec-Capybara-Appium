require_relative "capy"

RSpec.configure do |config|
  ENV["HASH_USER"] = "bs://1a4806c03f9f7a42c350791dc3372ca0ed834dfa"
  ENV["USER_BS"] = "nametest_CZgRBq"
  ENV["HASH_KEY"] = "wgdJ6eNqMsyexkVUwhzp"
  ENV["RETRIES"] = 3.to_s

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
