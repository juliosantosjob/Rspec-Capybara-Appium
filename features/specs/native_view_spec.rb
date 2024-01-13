require_relative "../actions/native_view_action"

RSpec.describe "Native view demo", :native_view_regression, :regression do
  before(:each) do
    @login.go_app
    @login.fill("admin", "admin")
  end

  it "Native view - checking native text", :native_text do
    @native_view.go_native_view_screen
  end
end
