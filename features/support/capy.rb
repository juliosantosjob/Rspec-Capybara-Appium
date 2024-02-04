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

platform = ENV["PLATFORM"].upercase
if platform == "android"
  caps_file = "caps_android.yml"
elsif platform == "ios"
  caps_file = "caps_ios.yml"
else
  raise "Error: The argument \"#{platform}\" is invalid!"
end

desired_caps = YAML.load_file(File.join(__dir__, "caps", caps_file))
Capybara.register_driver(:appium) do |app|
  Appium::Capybara::Driver.new app, caps: desired_caps["caps"], appium_lib: desired_caps["appium_lib"]
end

Capybara.configure do |config|
  include RSpec::Matchers
  config.default_max_wait_time = 10
  config.default_driver = :appium
end

RSpec.configure do |config|
  config.formatter = AllureRspecFormatter
end

Allure.configure do |config|
  config.results_directory = "allure-results"
  config.clean_results_directory = true
  config.logging_level = Logger::INFO
end
