require "rake"
require "httparty"
require "rspec/core/rake_task"

desc "Auto-correct code"
task :auto_correct do
  sh "rubocop --auto-correct"
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

RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = "features/specs/*.rb --format html --out logs/rspec_results.html"
end

namespace :rspec_report do
  desc "Run all specs and generate RSpec report in HTML"
  task :html => :spec

  desc "Run all specs, generate RSpec report and open it in the browser"
  task :browser do
    Rake::Task[:spec].invoke
    `open reports/rspec_results.html`
  end
end
