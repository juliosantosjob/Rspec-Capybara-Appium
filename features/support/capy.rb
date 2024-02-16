require "rspec"
require "appium_capybara"
require "site_prism"
require "yaml"
require "allure-rspec"
require "allure-ruby-commons"
require "capybara"
require "browserstack/local"
require "selenium-webdriver"
require "appium_lib"
require_relative "hooks"
require_relative "instances"
require_relative "screen_capture"

ENV["PLATFORM"] ||= "ANDROID"

case ENV["PLATFORM"].upcase
when "ANDROID"
  caps_file = "caps_android.yml"
when "IOS"
  caps_file = "caps_ios.yml"
when "ANDROID_CLOUD"
  caps_file = "caps_android_bs.yml"
when "IOS_CLOUD"
  caps_file = "caps_ios_bs.yml"
else
  raise ArgumentError, "The platform '#{ENV["PLATFORM"]}' is invalid!"
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
end
