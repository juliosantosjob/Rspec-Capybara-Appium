require_relative "env"

RSpec.configure do |config|
  config.after(:each) { Capybara.current_session.driver.quit }

  # screenshot = "screenshots/evidence.png"
  # Capybara.current_session.driver.appium_driver.save_screenshot(screenshot)
  # encoded_img = Capybara.current_session.driver.appium_driver.screenshot_as(:base64)
  # embed("data:image/png;base64,#{encoded_img}","image/png")
end
