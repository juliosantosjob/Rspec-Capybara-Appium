require_relative "env"

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
    capy_driver = Capybara.current_session.driver
    puts example.exception.nil? ? "Test successful!" : "Test fail!"
    puts ".."

    begin
      Dir.mkdir("logs") unless Dir.exist?("logs")
      capy_driver.save_screenshot("logs/#{example.description.gsub(" ", "_").downcase}_" \
        "#{example.exception.nil? ? "passed" : "failed"}.png")
    rescue StandardError => e
      puts "Error: Unable to perform screenshot action! #{e.message}"
    end
  end

  config.after :all do |example|
    puts "\nTotal examples: #{RSpec.world.example_count}"
  end
end
