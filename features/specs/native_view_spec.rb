require_relative "../screens/native_view_screen"

RSpec.describe "Native view demo", :regression do
  it "Native view - checking native text", :native_text do
    @login.go_app
    @login.fill("admin", "admin")
    @login.at_home
    @native_view.go_native_view_screen
    @native_view.see_first_text_view("Hello World, I'm View one")
    @native_view.see_second_text_view("Hello World, I'm View two")
    @native_view.see_third_text_view("Hello World, I'm View three")
  end
end
