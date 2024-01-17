require_relative "env"

# Instances all class of project
RSpec.configure do |config|
  config.before(:each) do
    @login = LoginScreen.new
    @native_view = NativeViewScreen.new
  end
end
