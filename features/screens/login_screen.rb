require_relative "../support/env"
require_relative "../utils/helpers"
require_relative "../support/hooks"

class LoginScreen < SitePrism::Page.class_eval { include Helper }
  element :btn_login, :xpath, "//*[@content-desc='login']/android.widget.Button/android.widget.TextView", text: "LOG IN"
  element :fld_username, :accessibility_id, "username"
  element :fld_password, :accessibility_id, "password"
  element :fld_samples_list, :xpath, "//*[contains(@text,'Samples List')]"

  def go_app
    element = btn_login.visible?
    expect(element).to be_truthy
  end

  def fill(username, password)
    fill(fld_username, username)
    fill(fld_username, password)
    wait_and_click(btn_login, 5)
  end

  def app_is_open
    element = fld_samples_list.visible?
    expect(element).to be_truthy
  end
end
