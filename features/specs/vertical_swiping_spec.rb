require_relative "../screens/vertical_swiping_screen"

RSpec.describe "Vertical swiping", :regression, :regression_vertical_swiping do
  before do
    @login.go_app
    @login.fill("admin", "admin")
    @login.at_home
  end

  it "Vertical swiping - Checking first vertical swiping", :vertical_swiping do
    @vertical_swiping.go_vertical_swiping_screen
    @vertical_swiping.perform_vertical_swiping
  end
end
