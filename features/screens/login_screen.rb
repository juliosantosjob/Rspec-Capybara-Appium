require "rspec"
require_relative "../support/env"
require_relative "../utils/helpers"

class LoginScreen < SitePrism::Page
  include Capybara::DSL
  include RSpec::Matchers
  include Helper

  element :btn_login, :xpath, "//*[@content-desc='login']/android.widget.Button/android.widget.TextView", text: "LOG IN"
  element :fld_username, :accessibility_id, "username"
  element :fld_password, :accessibility_id, "password"
  element :fld_samples_list, :xpath, "//*[contains(@text,'Samples List')]"
  element :msg_error, :id, "android:id/message"

  def go_app
    expect(btn_login.visible?).to be_truthy
  end

  def fill(username, password)
    fill_value(fld_username, username)
    fill_value(fld_password, password)
    wait_and_tap(btn_login, 5)
  end

  def at_home
    expect(fld_samples_list.visible?).to be_truthy
  end

  def error_msg(msg)
    expect(msg_error.text).to eq(msg)
    expect(msg_error.visible?).to be_truthy
  end
end
