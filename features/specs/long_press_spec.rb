require_relative "../screens/long_press_screen"

RSpec.describe "Long press button", :regression do
  before do
    @login.go_app
    @login.fill("admin", "admin")
    @login.at_home
  end

  it "Checking long press", :long_press do
    @long_press.access_long_press_screen
    @long_press.do_a_long_press
    @long_press.long_press_message("you pressed me hard :P")
  end
end
