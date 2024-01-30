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
    output_path = "allure-results"

    puts "--{ #{test_pass ? "Test successful!" : "Test fail!" } }--"
    puts "..."

    begin
      Dir.mkdir(output_path) unless Dir.exist?(output_path)
      shot_path = "#{output_path}/#{example.description.gsub(" ", "_").downcase}" \
        "_#{test_pass ? "passed" : "failed"}.png"

      Capybara.current_session.driver.save_screenshot(shot_path)
    rescue StandardError => e
      puts "Error: Unable to perform screenshot action! #{e.message}"
    end

    Allure.add_attachment(
      name: shot_path,
      type: Allure::ContentType::PNG,
      source: File.open(shot_path)
    )
  end
end
