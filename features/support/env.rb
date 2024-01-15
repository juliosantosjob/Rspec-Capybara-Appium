require "rspec"
require "capybara"
require "capybara/rspec"
require "appium_capybara"
require "site_prism"
require "rubocop"
require "ruby-lsp"
require "yaml"
require_relative "hooks"
require_relative "instances"

appium_caps = YAML.load_file("features/support/caps/caps_android.yml")
caps = appium_caps["caps"]
appium_lib = appium_caps["appium_lib"]

Capybara.register_driver(:appium) do |app|
  Appium::Capybara::Driver.new app, caps: caps, appium_lib: appium_lib
end

Capybara.configure do |config|
  include RSpec::Matchers
  config.default_max_wait_time = 10
  config.default_driver = :appium
end
