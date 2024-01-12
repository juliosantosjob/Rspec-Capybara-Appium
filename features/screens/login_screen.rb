require_relative "../support/env"
require_relative "../utils/helpers"

class LoginScreen < SitePrism::Page.class_eval { include Helper }
  include RSpec::Matchers

  def go_app
    element = find_element(:accessibility_id, "login").displayed?
    expect(element).to be_truthy
  end

  def fill(username, password)
    find_element(:accessibility_id, "username").send_keys("admin")
    find_element(:accessibility_id, "password").send_keys("admin")
    find_element(:accessibility_id, "login").click
  end

  def app_is_open
    element = find_element(:xpath, "//*[contains(@text,'Samples List')]").displayed?
    expect(element).to be_truthy
  end
end
