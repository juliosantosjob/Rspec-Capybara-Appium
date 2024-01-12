require "rspec"
require "capybara"
require "capybara/rspec"
require "appium_capybara"
require "site_prism"
require "rubocop"
require "ruby-lsp"

require_relative "hooks"

caps = {
  "platformName" => "Android",
  "deviceName" => "emulator",
  "appium:app" => "./app/VodQA.apk",
  "appium:appActivity" => "com.vodqareactnative.MainActivity"
}

Capybara.register_driver(:appium) do |app|
  Appium::Capybara::Driver.new app, caps: caps, appium_lib: { server_url: "http://localhost:4723/wd/hub" }
end

Capybara.configure do |config|
  include RSpec::Matchers
  config.default_max_wait_time = 20
  config.default_driver = :appium
end
