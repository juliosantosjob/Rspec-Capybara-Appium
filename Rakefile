require "rake"
require "httparty"
require_relative "features/support/capy"

desc "Exec project"
task :run, [:platform, :tag] do |task, args|
  ENV["PLATFORM"] = args.platform

  caps, appium_lib = desired_caps
  puts "────────────────────────────────────────────────"
  puts  "| Platform: #{caps.values[0]} \n" \
        "| Device: #{caps.values[1]} \n" \
        "| Server: #{appium_lib.values[0]} \n" \
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

desc "Download the app for project"
namespace :build do
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
