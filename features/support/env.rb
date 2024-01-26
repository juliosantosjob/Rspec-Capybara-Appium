require "rspec"
require "appium_capybara"
require "appium_lib"
require "site_prism"
require "rubocop"
require "yaml"
require "ruby-lsp"
require "selenium-webdriver"
require_relative "hooks"
require_relative "instances"

desired_caps = YAML.load_file("features/support/caps/caps_android.yml")
caps = desired_caps["caps"]
appium_lib = desired_caps["appium_lib"]

Capybara.register_driver(:appium) do |app|
  Appium::Capybara::Driver.new app, caps: caps, appium_lib: appium_lib
end

Capybara.configure do |config|
  config.default_max_wait_time = 10
  config.default_driver = :appium
end

$driver = Capybara.current_session.driver.appium_driver
