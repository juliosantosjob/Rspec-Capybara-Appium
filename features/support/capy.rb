require "rspec"
require "appium_capybara"
require "site_prism"
require "yaml"
require "allure-rspec"
require "allure-ruby-commons"
require "capybara"
require_relative "hooks"
require_relative "instances"
require_relative "reports"

desired_caps = YAML.load_file(File.join(__dir__, "caps", "caps_android.yml"))

Capybara.register_driver(:appium) do |app|
  caps = desired_caps["caps"]
  appium_lib = desired_caps["appium_lib"]
  Appium::Capybara::Driver.new app, caps: caps, appium_lib: appium_lib
end

Capybara.configure do |config|
  config.default_max_wait_time = 10
  config.default_driver = :appium
  include RSpec::Matchers
end

RSpec.configure do |config|
  config.formatter = AllureRspecFormatter
end

Allure.configure do |config|
  config.results_directory = "allure-results"
  config.clean_results_directory = true
  config.logging_level = Logger::INFO
end
