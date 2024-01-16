require "rake"
require "httparty"

desc "Safe auto-correct"

task :auto_correct do
  sh "rubocop --auto-correct"
end

task :regression do
  sh "rspec features/specs"
end

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
