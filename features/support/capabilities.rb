def desired_caps
  caps = {}
  appium_lib = {}

  case ENV["PLATFORM"].upcase
  when "ANDROID"
    caps[:platformName] = "Android"
    caps[:deviceName] = "Emulator Android"
    caps[:automationName] = "uiautomator2"
    caps[:app] = "./app/VodQA.apk"
    caps[:appActivity] = "com.vodqareactnative.MainActivity"
    appium_lib[:server_url] = "http://localhost:4723/wd/hub"

  when "IOS"
    caps[:platformName] = "iOS"
    caps[:deviceName] = "Emulator IPhone"
    caps[:automationName] = "XCUITest"
    caps[:app] = "./app/VodQA.ipa"
    caps[:bundleId] = "com.vodqareactnative"
    appium_lib[:server_url] = "http://localhost:4723/wd/hub"

  when "ANDROID_CLOUD"
    caps[:platformName] = "Android"
    caps[:deviceName] = "Emulator Android"
    caps[:build] = "E2e testing with ruby"
    caps[:device] = "Google Pixel 4"
    caps[:app] = ENV["HASH_USER"]
    appium_lib[:server_url] = "https://#{ENV["USER_BS"]}:#{ENV["USER_KEY"]}@hub-cloud.browserstack.com/wd/hub"

  when "IOS_CLOUD"
    caps[:platformName] = "iOS"
    caps[:deviceName] = "Emulator IPhone"
    caps[:platformVersion] = "14.0"
    caps[:automationName] = "XCUITest"
    caps[:app] = ENV["HASH_USER"]
    appium_lib[:server_url] = "https://#{ENV["USER_BS"]}:#{ENV["USER_KEY"]}@hub-cloud.browserstack.com/wd/hub"

  else
    raise ArgumentError, "The platform '#{ENV["PLATFORM"]}' is invalid!"
  end

  return caps, appium_lib
end
