require "rspec"
require "rspec/retry"
require "appium_capybara"
require "site_prism"
require "yaml"
require "allure-rspec"
require "rubocop"
require "appium_lib"
require "browserstack/local"
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
  config.verbose_retry = true
  config.default_retry_count = ENV["RETRIES"]
  config.default_sleep_interval = 1

  config.around :each do |exemplo|
    exemplo.run_with_retry retry: ENV["RETRIES"]
  end

  config.add_formatter("AllureRspecFormatter")
end

Allure.configure do |config|
  config.results_directory = "allure-results"
  config.clean_results_directory = true
end
