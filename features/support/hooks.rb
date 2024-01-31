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
    success = "\e[32m\u2713 Test successful!\e[0m"
    error = "\e[31m\u2717 Test fail!\e[0m"
    puts example.exception.nil? ? success : error
  end

  config.after :each do |example|
    begin
      output_path = "allure-results"
      shot_path = "#{output_path}/#{example.description.gsub(" ", "_").downcase}" \
        "_#{example.exception.nil? ? "passed" : "failed"}.png"

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
