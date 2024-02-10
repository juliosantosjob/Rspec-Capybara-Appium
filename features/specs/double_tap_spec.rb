require_relative "../screens/double_tap_screen"

RSpec.describe "Double tap", :regression do
  before do
    @login.go_app
    @login.fill("admin", "admin")
    @login.at_home
  end

  it "Checking double tap", :double_tap do
    @double_tap.access_double_tap_screen
    @double_tap.do_a_double_tap
    @double_tap.display_message("Double tap successful!")
  end
end
