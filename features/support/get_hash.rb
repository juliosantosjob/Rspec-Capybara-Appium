require 'httparty'

url = "https://api-cloud.browserstack.com/app-automate/upload"
file_path = "./app/VodQA.apk"
custom_id = "SampleApp"

response = HTTParty.post(url,
  basic_auth: { username: ENV["USER_BS"], password: ENV["USER_KEY"] },
  body: {
    file: File.new(file_path),
    custom_id: custom_id,
    ios_keychain_support: true
  }
)

puts response.body