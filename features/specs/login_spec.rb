require_relative "../screens/login_screen"

RSpec.describe "Login user" do
  before(:each) do
    @login = LoginScreen.new
  end

  it "Login - Happy path", :login do
    @login.go_app
    @login.fill("admin", "admin")
    @login.app_is_open
  end
end
