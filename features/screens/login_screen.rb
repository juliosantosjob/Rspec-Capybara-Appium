require_relative "../support/env"
require_relative "../utils/helpers"

class LoginScreen < SitePrism::Page
  include RSpec::Matchers

  element :scr_swage_labs, :xpath, "(//*[@content-desc='test-Login'])[1]"
  element :fld_user_name, :accessibility_id, "test-Username"
  element :fld_passwd, :accessibility_id, "test-Password"
  element :btn_login, :accessibility_id, "test-LOGIN"
  element :fld_product, :xpath, "//*[@content-desc='test-Cart drop zone']/android.view.ViewGroup/android.widget.TextView"
  element :fld_error, :xpath, "//android.view.ViewGroup[@content-desc='test-Error message']/android.widget.TextView"

  def go_app
    expect(scr_swage_labs.visible?).to eq true
  end

  def fill(username, passwd)
    fld_user_name.set(username)
    fld_passwd.set(passwd)
    btn_login.click
  end

  def show_home
    expect(fld_product.visible?).to eq true
    expect(fld_product["text"].downcase).to eq("products")
  end

  def show_error(msg_error)
    expect(fld_error.visible?).to eq true
    expect(fld_error["text"]).to eq(msg_error)
  end
end
