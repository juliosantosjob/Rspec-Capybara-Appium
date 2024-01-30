require_relative "../screens/native_view_screen"

RSpec.describe "Native view demo", :regression do
  let(:text_views) { YAML.load_file("features/constants/data.yml")["native_views"].values }

  before do
    @login.go_app
    @login.fill("admin", "admin")
    @login.at_home
  end

  it "Checking native text", :native_text do
    @native_view.access_native_view_screen
    text_views.each do |expect_text_view|
      @native_view.see_text_view(expect_text_view)
    end
  end
end
