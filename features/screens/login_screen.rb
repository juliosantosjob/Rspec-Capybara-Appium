require_relative "../support/capy"
require_relative "../support/base_screen"
require_relative "../utils/helpers"

class LoginScreen < BaseScreen
  include Helper

  def initialize
    @locators = get_path("features/locators/login.yml")
  end

  def go_app
    expect(new_find(@locators["btn_login"]).visible?).to be_truthy
  end

  def fill(username, password)
    new_find(@locators["fld_username"]).set(username)
    new_find(@locators["fld_password"]).set(password)
    wait_and_tap(@locators["btn_login"])
  end

  def at_home
    list_home = new_find(@locators["fld_samples_list"])
    expect(list_home.visible?).to be_truthy
  end

  def error_msg(msg)
    error = new_find(@locators["msg_error"])

    expect(error.text).to eq(msg)
    expect(error.visible?).to be_truthy
  end
end
