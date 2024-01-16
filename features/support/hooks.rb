require_relative "env"

RSpec.configure do |config|
  config.before(:each) do
    @driver = Capybara.current_session.driver.appium_driver
  end

  config.after(:each) do
    Capybara.current_session.driver.quit
  end
end
