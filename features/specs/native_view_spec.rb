require_relative "../screens/native_view_screen"

RSpec.describe "Native view demo", :regression do
  it "Native view - checking native text", :native_text do
    text_views = [
      "Hello World, I'm View one",
      "Hello World, I'm View two",
      "Hello World, I'm View three"
    ]

    @login.go_app
    @login.fill("admin", "admin")
    @login.at_home
    @native_view.go_native_view_screen
    text_views.each do |text|
      @native_view.see_text_view(text)
    end
  end
end
