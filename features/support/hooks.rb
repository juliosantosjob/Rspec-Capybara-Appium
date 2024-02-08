require_relative "capy"

def print_test_result(example)
  name_feature = example.example_group.description
  name_test = example.description
  status = example.exception.nil? ? "\e[32m\u2713" : "\e[31m\u2717"

  puts "Feature: \"#{name_feature}\" / Test: \"#{name_test}\" / Status: #{status} \e[0m"
  puts "\e[31mError: #{example.exception}\e[0m" if example.exception
  puts example.exception.backtrace.join("\n") if example.exception
end

RSpec.configure do |config|
  config.before(:each) { $driver = Capybara.current_session.driver.appium_driver }
  config.after(:each) { Capybara.current_session.driver.quit }

  config.after :each do |example|
    print_test_result(example)
  end

  config.after :suite do |example|
    all_count = RSpec.world.example_count
    error_count = RSpec.world.filtered_examples.values.flatten.count(&:exception)
    success_count = all_count - error_count

    puts "\n(total #{all_count}, passed #{success_count}, failed #{error_count})"
  end
end
