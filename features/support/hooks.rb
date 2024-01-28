require_relative "configs_capy"

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
    test_pass = example.exception.nil?

    capy_driver = Capybara.current_session.driver
    puts test_pass ? "Test successful!" : "Test fail!"
    puts "..."

    begin
      Dir.mkdir("logs") unless Dir.exist?("logs")
      shot_path = "logs/#{example.description.gsub(" ", "_").downcase}_" \
      "#{test_pass ? "passed" : "failed"}.png"

      capy_driver.save_screenshot(shot_path)
    rescue StandardError => e
      puts "Error: Unable to perform screenshot action! #{e.message}"
    end
  end
end
