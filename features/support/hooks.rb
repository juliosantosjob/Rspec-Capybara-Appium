require_relative "env"

RSpec.configure do |config|
  config.before(:each) { $driver = Capybara.current_session.driver.appium_driver }
end

RSpec.configure do |config|
  config.after(:each) { Capybara.current_session.driver.quit }
end
