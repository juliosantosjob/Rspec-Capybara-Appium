require 'httparty'

base_url = "https://api-cloud.browserstack.com"

response = HTTParty.post("#{base_url}/app-automate/espresso/v2/upload",
    basic_auth: { username: ENV["BS_USER"], password: ENV["BS_KEY"] }, 
    body: { file: File.new("/caminho/do/seu/arquivo.apk"),
    headers: { "Content-Typ" : "multipart/form-data" }
})

puts response.body