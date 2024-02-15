require_relative "../screens/carousel_screen"

RSpec.describe "Carousel", :regression do
  before do
    @login.go_app
    @login.fill("admin", "admin")
    @login.at_home
  end

  it "Checking carousel", :carousel do
    @carousel.access_carousel_screen
    @carousel.spin_the_carousel
  end
end
