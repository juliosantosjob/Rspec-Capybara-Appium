require_relative "../support/capy"
require_relative "../utils/helpers"

class LoginScreen < SitePrism::Page
  include Helper

  element :btn_login, :accessibility_id, "login"
  element :fld_username, :accessibility_id, "username"
  element :fld_password, :accessibility_id, "password"
  element :fld_samples_list, :xpath, "//*[contains(@text,'Samples List')]"
  element :msg_error, :id, "android:id/message"

  def go_app
    assert_visible(btn_login)
  end

  def fill(username, password)
    fill_value(fld_username, username)
    fill_value(fld_password, password)
    wait_and_tap(btn_login, 5)
  end

  def at_home
    assert_visible(fld_samples_list)
  end

  def error_msg(msg)
    assert_text(msg_error, msg)
    assert_visible(msg_error)
  end
end
