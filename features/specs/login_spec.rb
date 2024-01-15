require_relative "../screens/login_screen"

RSpec.describe "User Login", :login_regression, :regression do
  let(:user_data) { YAML.load_file("constants/data.yml")["user"] }

  before(:each) do
    @username = user_data["username"]
    @password = user_data["password"]
  end

  it "Login - Happy path", :login do
    @login.go_app
    @login.fill(@username, @password)
    @login.at_home
  end

  it "Login - Invalid username credential", :invalid_username do
    @login.go_app
    @login.fill("invalid", @password)
    @login.error_msg("Invalid  Credentials")
  end

  it "Login - Invalid password credential", :invalid_password do
    @login.go_app
    @login.fill(@username, "invalid")
    @login.error_msg("Invalid  Credentials")
  end

  it "Login - Empty credentials", :two_empty do
    @login.go_app
    @login.fill("", "")
    @login.error_msg("Please enter Username or password")
  end
end
