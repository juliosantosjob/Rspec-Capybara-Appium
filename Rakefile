require "rake"
require "httparty"
require_relative "features/support/capy"

desc "Exec project"
task :run, [:tag] do |task, args|
  platform = ENV["PLATFORM"].downcase
  if platform == "android"
    caps_file = "caps_android.yml"
  elsif platform == "ios"
    caps_file = "caps_ios.yml"
  else
    raise "Error: The argument \"#{platform}\" is invalid!"
  end

  desired_caps = YAML.load_file("features/support/caps/#{caps_file}")

  puts "____________________________________________"
  puts  "| Platform: #{desired_caps.dig("caps", "platformName")} \n" \
        "| Device: #{desired_caps.dig("caps", "deviceName")} \n" \
        "| Server: #{desired_caps.dig("appium_lib", "server_url")} \n" \
        "-------------------------------------------\n\n"

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

def download_app(url, filename)
  unless Dir.exist?("app")
    FileUtils.mkdir_p("app")
    
    response = HTTParty.get(url)
    File.write(File.join(__dir__, "app", filename), response.body)
  end
end

desc "Download the app for Android project"
task :build_android do
  download_app("https://github.com/shridharkalagi/AppiumSample/raw/master/VodQA.apk", "VodQA.apk")
end

desc "Download the app for iOS project"
task :build_ios do
  download_app("https://example.com/path/to/your.ipa", "VodQA.ipa") # url download of project IPA
end