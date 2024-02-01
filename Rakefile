require "rake"
require "httparty"
require_relative "features/support/capy"

desc "Exec project"
task :run, [:tag] do |task, args|
  case ENV["PLATFORM"].downcase
  when "android"
    desired_caps = YAML.load_file("features/support/caps/caps_android.yml")
  when "ios"
    desired_caps = YAML.load_file("features/support/caps/caps_ios.yml")
  else
    raise "Error: The argument \"#{ENV["PLATFORM"]}\" is invalid!"
  end

  puts "..."
  puts  "<< Platform: #{desired_caps.dig("caps", "platformName")} >> \n" \
        "<< DeviceName: #{desired_caps.dig("caps", "deviceName")} >> \n" \
        "<< Server: #{desired_caps.dig("appium_lib", "server_url")} >> \n" \
        "...\n\n"

  sh "rspec features/specs -t #{args.tag}"
end

desc "Auto-correct code"
task :rubo do
  sh "rubocop --auto-correct"
end

desc "Add allure stories to the allure report"
task :allure_open do
  sh "allure generate && (move allure-report/history allure-results/history)" unless Dir.exist?("allure-results")
  sh "allure serve"
end

desc "Donwload to app on project"
task :build_app do
  @url_apk = "https://github.com/shridharkalagi/AppiumSample/raw/master/VodQA.apk"

  unless Dir.exist?("app")
    Dir.mkdir("app")

    response = HTTParty.get(@url_apk)
    file_path = File.join(__dir__, "app", "VodQA.apk")

    File.open(file_path, "wb") do |file|
      file.write(response.body)
    end
  end
end
