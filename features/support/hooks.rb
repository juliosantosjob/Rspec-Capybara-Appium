require_relative "env"

RSpec.configure do |config|
  config.before(:each) do
    $driver = Capybara.current_session.driver.appium_driver
  end

  config.after(:each) do |example|
    Capybara.current_session.driver.save_screenshot("reports/evidence.png")
    Capybara.current_session.driver.quit
  end
end
