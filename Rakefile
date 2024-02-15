require "rake"
require "httparty"
require_relative "features/support/capy"

desc "Exec project"
task :run, [:platform, :tag] do |task, args|
  args.platform ||= "ANDROID"

  ENV["PLATFORM"] = args.platform.upcase
  if ENV["PLATFORM"] == "ANDROID"
    caps_file = "caps_android.yml"
  elsif ENV["PLATFORM"] == "IOS"
    caps_file = "caps_ios.yml"
  else
    raise "Error: The argument \"#{ENV["PLATFORM"]}\" is invalid!"
  end

  desired_caps = YAML.load_file("features/support/caps/#{caps_file}")

  puts "────────────────────────────────────────────────"
  puts  "| Platform: #{desired_caps.dig("caps", "platformName")} \n" \
        "| Device: #{desired_caps.dig("caps", "deviceName")} \n" \
        "| Server: #{desired_caps.dig("appium_lib", "server_url")} \n" \
        "────────────────────────────────────────────────\n"
  sh "rspec features/specs #{args.tag.nil? ? "" : "-t #{args.tag}"}"
end

desc "Auto-correct Ruby code style"
task :rubo do
  sh "rubocop --auto-correct"
end

desc "Generate and serve Allure report with stories"
task :allure_open do
  sh "allure generate --clean"
  sh "move allure-report/history allure-results/history"
  sh "allure serve"
end

desc "Download the app for Android project"
task :build do
  task :android do
    Dir.mkdir("app") unless Dir.exist?("app")
    response = HTTParty.get("https://github.com/shridharkalagi/AppiumSample/raw/master/VodQA.apk")

    file_path = File.join(__dir__, "app", "VodQA.apk")
    File.open(file_path, "wb") { |file| file.write(response.body) }
  end

  task :ios do
    Dir.mkdir("app") unless Dir.exist?("app")
    response = HTTParty.get("https://example.com/path/to/app.ipa")

    file_path = File.join(__dir__, "app", "VodQA.ipa")
    File.open(file_path, "wb") { |file| file.write(response.body) }
  end
end
