require_relative "env"

RSpec.configure do |config|
  config.before(:each) do
    Capybara.current_session.driver.appium_driver

    @login = LoginScreen.new
    @native_view = NativeViewScreen.new
  end

  config.after(:each) do
    Capybara.current_session.driver.quit
  end
end
