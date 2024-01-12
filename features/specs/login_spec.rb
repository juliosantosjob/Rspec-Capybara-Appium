require_relative "../screens/login_screen"

RSpec.describe "Login user" do
  before(:each) do
    @login = LoginScreen.new
    @login.go_app
  end

  it "Login - Happy path", :login do
    @login.fill("standard_user", "secret_sauce")
    @login.app_is_open
  end
end
