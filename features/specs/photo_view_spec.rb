require_relative "../screens/photo_view_screen"

RSpec.describe "Photo view", :regression do
  before do
    @login.go_app
    @login.fill("admin", "admin")
    @login.at_home
  end

  it "Checking photo view", :photo_view do
    @photo_view.access_photo_view_screen
    @photo_view.successful_image_zoom
  end
end
