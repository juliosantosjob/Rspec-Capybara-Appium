require_relative "env"

RSpec.configure do |config|
  config.before(:each) do
    Capybara.current_session.driver.appium_driver
  end

  config.after(:each) do |example|
    Capybara.current_session.driver.quit
  end
end
