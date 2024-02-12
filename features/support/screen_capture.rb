require_relative "capy"

RSpec.configure do |config|
  config.after :each do |example|
    begin
      output_path = "allure-results"
      Dir.mkdir(output_path) unless Dir.exist?(output_path)

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
