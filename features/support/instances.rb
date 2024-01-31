require_relative "capy"

RSpec.configure do |config|
  config.before(:each) do
    @login = LoginScreen.new
    @native_view = NativeViewScreen.new
    @slider = SliderScreen.new
    @vertical_swiping = VerticalSwipingScreen.new
    @drag_and_drop = DragAndDropScreen.new
  end
end
