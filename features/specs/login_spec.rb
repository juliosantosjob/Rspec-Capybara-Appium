require_relative "../actions/login_action"

RSpec.describe "Login user" do
  before(:each) do
    @login = LoginActions.new
  end

  it "Login - Happy path", :login do
    @login.go_app
    @login.fill("admin", "admin")
    @login.app_is_open
  end
end
