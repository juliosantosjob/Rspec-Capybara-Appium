require_relative "../support/capy"
require_relative "../utils/helpers"

class LoginScreen
  include Helper

  def go_app
    btn_login = find_element($login_elements["btn_login"])
    expect(btn_login.visible?).to be_truthy
  end

  def fill(username, password)
    find_element($login_elements["fld_username"]).set(username)
    find_element($login_elements["fld_password"]).set(password)
    find_element($login_elements["btn_login"]).click
  end

  def at_home
    list_home = find_element($login_elements["fld_samples_list"])
    expect(list_home.visible?).to be_truthy
  end

  def error_msg(msg)
    error = find_element($login_elements["msg_error"])

    expect(error.text).to eq(msg)
    expect(error.visible?).to be_truthy
  end
end
