require_relative "capy"

RSpec.configure do |config|
  config.before(:each) { $driver = Capybara.current_session.driver.appium_driver }
  config.after(:each) { Capybara.current_session.driver.quit }

  config.after :each do |example|
    status = example.exception.nil? ? "\e[32m\u2713\e[0m" : "\e[31m\u2717\e[0m"
    puts "<< Test: \"#{example.description}\" ( #{status} ) >>"
  end

  config.after :suite do |example|
    all_count = RSpec.world.example_count
    erro_count = RSpec.world.filtered_examples.values.flatten.count(&:exception)
    success_count = RSpec.world.filtered_examples.values.flatten.reject(&:exception).count
    puts "\n(total #{all_count}, passed #{success_count}, failed #{erro_count})"
  end
end
