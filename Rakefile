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

  ## WARNING: To run the project you need to pass the platform and
  ## the name of the feature example: "rake run[android,login]"
end

desc "Auto-correct code"
task :rubo do
  sh "rubocop --auto-correct"
end

desc "Add allure stories to the allure report"
task :allure_open do
  sh "allure generate --clean"
  sh "move allure-report/history allure-results/history"
  sh "allure serve"
end

def download_app(url, filename)
  unless Dir.exist?("app")
    Dir.mkdir("app")

    response = HTTParty.get(url)
    file_path = File.join(__dir__, "app", filename)

    File.open(file_path, "wb") do |file|
      file.write(response.body)
    end
  end
end

desc "Download the app for Android project"
task :build_android do
  download_app("https://github.com/shridharkalagi/AppiumSample/raw/master/VodQA.apk", "VodQA.apk")
end

desc "Download the app for iOS project"
task :build_ios do
  download_app("https://example.com/path/to/app.ipa", "VodQA.ipa") #--> url download of project IPA
end
