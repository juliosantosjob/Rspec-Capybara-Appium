require_relative "../screens/drag_and_drop_screen"

RSpec.describe "Drag and drop", :regression do
  before do
    @login.go_app
    @login.fill("admin", "admin")
    @login.at_home
  end

  it "Checking drag and drop", :drag_and_drop do
    @drag_and_drop.access_drag_and_drop_screen
    @drag_and_drop.select_drag
    @drag_and_drop.verify_success_message("Circle dropped")
  end
end
