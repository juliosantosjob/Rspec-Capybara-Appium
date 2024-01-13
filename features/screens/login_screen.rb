require_relative "../support/env"

class LoginScreen < SitePrism::Page
  element :btn_login, :xpath, "//*[@content-desc='login']/android.widget.Button/android.widget.TextView", text: "LOG IN"
  element :fld_username, :accessibility_id, "username"
  element :fld_password, :accessibility_id, "password"
  element :fld_samples_list, :xpath, "//*[contains(@text,'Samples List')]"
  element :error_message, :id, "android:id/message"
end
