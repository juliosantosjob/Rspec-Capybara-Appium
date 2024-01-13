require_relative "env"

RSpec.configure do |config|
  config.before(:each) do
    Capybara.current_session.driver.appium_driver

    @login = LoginActions.new
    @native_view = NativeViewActions.new
  end
end

RSpec.configure do |config|
  config.after(:each) { Capybara.current_session.driver.quit }
end
