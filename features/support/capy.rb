require "rspec"
require "appium_capybara"
require "site_prism"
require "yaml"
require "allure-rspec"
require "capybara"
require "browserstack/local"
require "selenium-webdriver"
require "appium_lib"
require_relative "hooks"
require_relative "instances"
require_relative "screen_capture"
require_relative "capabilities"

Capybara.register_driver(:appium) do |app|
  caps, appium_lib = desired_caps
  Appium::Capybara::Driver.new(app, caps: caps, appium_lib: appium_lib)
end

Capybara.configure do |config|
  include RSpec::Matchers
  config.default_max_wait_time = 10
  config.default_driver = :appium
end

RSpec.configure do |config|
  config.formatter = AllureRspecFormatter
end

AllureRspec.configure do |config|
  config.results_directory = "allure-results"
  config.clean_results_directory = true
end
