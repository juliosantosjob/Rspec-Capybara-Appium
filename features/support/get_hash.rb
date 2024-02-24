require 'httparty'

base_url = "https://api-cloud.browserstack.com"
user_credential = ENV["BS_USER"]
key_credencial = ENV["BS_KEY"]

response = HTTParty.post("#{base_url}/app-live/upload",
    basic_auth: { 
        username: user_credential, 
        password: key_credencial
    },
    body: { file: File.new("/caminho/do/seu/arquivo.apk"),
    headers: { "Content-Typ" : "multipart/form-data" }
})

puts response.body