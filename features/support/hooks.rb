require_relative "capy"

RSpec.configure do |config|
  config.before :each do
    $driver = Capybara.current_session.driver.appium_driver
  end

  config.after :each do
    Capybara.current_session.driver.quit
  end

  config.before :each do |example|
    puts "..."
    puts "<< Running test: \"#{example.description}\" >>"
  end

  config.after :each do |example|
    success = "\e[32m\u2713 Test successful!\e[0m"
    error = "\e[31m\u2717 Test fail!\e[0m"

    if example.exception.nil?
      puts success
    else
      puts error
      puts "\e[31m\nError: #{example.exception}\e[0m"
    end
  end

  config.after(:suite) do |example|
    puts "\nTotal examples: #{RSpec.world.example_count}"
    erro_count = RSpec.world.filtered_examples.values.flatten.count(&:exception)
    puts "Número de cenários com erro: #{erro_count}"
  end
end
