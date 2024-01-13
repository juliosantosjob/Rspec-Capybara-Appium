require_relative "../utils/helpers"
require_relative "../screens/login_screen"

class LoginActions < LoginScreen
  include Helper

  def go_app
    element = btn_login.visible?
    expect(element).to be_truthy
  end

  def fill(username, password)
    fill_value(fld_username, username)
    fill_value(fld_password, password)
    wait_and_tap(btn_login, 5)
  end

  def app_is_open
    element = fld_samples_list.visible?
    expect(element).to be_truthy
  end

  def error_msg(msg)
    expect(error_message.text).to eq(msg)
    expect(error_message.visible?).to be_truthy
  end
end
