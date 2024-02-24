require 'httparty'

url = "https://api-cloud.browserstack.com/app-automate/espresso/v2/upload"
auth = { username: ENC["BS_USER"], password: ENV["BS_KEY"] }
file_path = "/caminho/do/seu/arquivo.apk"

response = HTTParty.post(url, basic_auth: auth, body: { file: File.new(file_path) })

puts response.body