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

task :allure_history do
  unless Dir.exist?("allure-results/allure-reports")
    sh "allure generate --allure-results allure-results/allure-reports" \
    " && (move allure-results/allure-reports/history allure-results/history)"
  end
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
