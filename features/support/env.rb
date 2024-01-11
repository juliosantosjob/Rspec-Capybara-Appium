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
  "appium:app" => "./app/SauceLabs.apk",
  "appium:appActivity" => "com.swaglabsmobileapp.MainActivity"
}

Capybara.register_driver(:appium) do |app|
  Appium::Capybara::Driver.new app, caps: caps, appium_lib: { server_url: "http://localhost:4723/wd/hub" }
end

Capybara.default_driver = :appium
Capybara.default_max_wait_time = 20
