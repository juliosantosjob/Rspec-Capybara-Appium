require_relative "../support/capy"
require_relative "../support/base_page"
require_relative "../utils/helpers"

class LoginScreen < BasePage
  include Helper

  #--> If it passes, inform iOS when executing the project, it will take the second argument.

  element :btn_login, "accessibility_id:login", "locator:ios"
  element :fld_username, "accessibility_id:username", "locator:ios"
  element :fld_password, "accessibility_id:password", "locator:ios"
  element :fld_samples_list, "xpath://*[contains(@text,'Samples List')]", "locator:ios"
  element :msg_error, "xpath:(//android.widget.TextView)[2]", "locator:ios"

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
