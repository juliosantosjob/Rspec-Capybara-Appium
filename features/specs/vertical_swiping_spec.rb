require_relative "../screens/vertical_swiping_screen"

RSpec.describe "Vertical swiping", :regression do
  before do
    @login.go_app
    @login.fill("admin", "admin")
    @login.at_home
  end

  it "Checking first vertical swiping", :vertical_swiping do
    @vertical_swiping.access_vertical_swiping_screen
    @vertical_swiping.vertical_swipe_success
  end
end
