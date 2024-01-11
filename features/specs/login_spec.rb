require_relative "../screens/login_screen"

RSpec.describe "Login user" do
  before(:each) do
    @login = LoginScreen.new
    @login.go_app
  end

  it "Login - Happy path", :login do
    @login.fill("standard_user", "secret_sauce")
    @login.show_home
  end

  it "Login - Username invalid", :username_error do
    @login.fill("standard_", "secret_sauce")
    @login.show_error("Username and password do not match any user in this service.")
  end

  it "Login - Password invalid", :passwd_error do
    @login.fill("standard_user", "un_error")
    @login.show_error("Username and password do not match any user in this service.")
  end

  it "Login - Username and password empty", :two_empty do
    @login.fill("", "")
    @login.show_error("Username is required")
  end
end
