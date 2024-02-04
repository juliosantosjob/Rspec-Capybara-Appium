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

desc "Donwload to app on project"
task :build_android do
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

task :build_ios do
  @url_ipa = "" # <-- url download of ipa project

  unless Dir.exist?("app")
    Dir.mkdir("app")

    response = HTTParty.get(@url_ipa)
    file_path = File.join(__dir__, "app", "VodQA.ipa")

    File.open(file_path, "wb") do |file|
      file.write(response.body)
    end
  end
end
