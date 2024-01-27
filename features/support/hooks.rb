require_relative "env"

RSpec.configure do |config|
  config.before :each do
    $driver = Capybara.current_session.driver.appium_driver
  end

  config.after :each do
    Capybara.current_session.driver.quit
  end

  # embed("data:image/png;#{encoded_img}", "image/png")

  config.after :each do |example|
    capy_driver = Capybara.current_session.driver
    # status = example.metadata[:execution_result].status
    name = example.metadata[:description]

    begin
      puts " "
      puts "<< Running scenario: #{name} >>"

      Dir.mkdir("logs") unless Dir.exist?("logs")
      capy_driver.save_screenshot("logs/#{name.downcase}_" \
      "#{example.metadata[:execution_result].status == "passed" ? "error" : "success"}.png")
    rescue StandardError => e
      puts "Error: Unable to perform screenshot action! #{e.message}"
    end
  end
end
