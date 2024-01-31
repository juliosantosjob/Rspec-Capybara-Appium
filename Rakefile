require "rake"
require "httparty"

desc "Exec project"
task :run, [:tag] do |task, args|
  sh "bundle exec rspec features/specs -t #{args.tag}"
end

desc "Auto-correct code"
task :rubo do
  sh "rubocop --auto-correct"
end

desc "Add allure stories to the allure report"
task :allure_history do
  sh "allure generate && (move allure-report/history allure-results/history)" unless Dir.exist?("allure-results")
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
