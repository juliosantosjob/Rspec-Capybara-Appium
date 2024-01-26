require_relative "env"

RSpec.configure do |config|
  config.after(:each) { Capybara.current_session.driver.quit }
end
