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

  it "Login - Invalid Credentials - Username error", :invalid_username do
    @login.go_app
    @login.fill("a", "admin")
    @login.error_msg("Invalid  Credentials")
  end

  it "Login - Invalid Credentials - Password error", :invalid_password do
    @login.go_app
    @login.fill("admin", "a")
    @login.error_msg("Invalid  Credentials")
  end
end
