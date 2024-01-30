require "rspec"
require "appium_capybara"
require "site_prism"
require "yaml"
require "allure-rspec"
require "capybara"
require_relative "hooks"
require_relative "instances"

Capybara.register_driver(:appium) do |app|
  desired_caps = YAML.load_file(File.join(__dir__, "caps", "caps_android.yml"))
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
  config.detail_color = :white
  config.failure_color = :red
  config.success_color = :blue

  config.formatter = AllureRspecFormatter
end

Allure.configure do |config|
  config.results_directory = "allure-results"
  config.clean_results_directory = false
end
