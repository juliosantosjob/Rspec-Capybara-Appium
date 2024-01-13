require_relative "../actions/login_action"

RSpec.describe "User Login", :login_regression, :regression do
  it "Login - Happy path", :login do
    @login.go_app
    @login.fill("admin", "admin")
    @login.at_home
  end

  it "Login - Invalid username credential", :invalid_username do
    @login.go_app
    @login.fill("invalid", "admin")
    @login.error_msg("Invalid  Credentials")
  end

  it "Login - Invalid password credential", :invalid_password do
    @login.go_app
    @login.fill("admin", "invalid")
    @login.error_msg("Invalid  Credentials")
  end

  it "Login - Empty credentials", :two_empty do
    @login.go_app
    @login.fill("", "")
    @login.error_msg("Please enter Username or password")
  end
end
