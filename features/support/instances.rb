require_relative "capy"

RSpec.configure do |config|
  config.before(:each) do
    @login ||= LoginScreen.new
    @native_view ||= NativeViewScreen.new
    @slider ||= SliderScreen.new
    @vertical_swiping ||= VerticalSwipingScreen.new
    @drag_and_drop ||= DragAndDropScreen.new
    @double_tap ||= DoubleTapScreen.new
    @long_press ||= LongPressScreen.new
    @photo_view ||= PhotoViewScreen.new
  end
end
