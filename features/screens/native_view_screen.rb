require_relative "../support/capy"
require_relative "../utils/helpers"

class NativeViewScreen
  include Helper

  def access_native_view_screen
    find_element($native_view_elements["btn_chained_view"]).click

    title = find_element($native_view_elements["fld_title_native_view"])
    expect(title.visible?).to be_truthy
  end

  def see_text_view(txt)
    all_text_views = [
      find_element($native_view_elements["fld_first_text_view"]),
      find_element($native_view_elements["fld_second_text_view"]),
      find_element($native_view_elements["fld_third_text_view"])
    ]
    current_text_view = all_text_views.find { |element| element.text.include?(txt) }
    expect(current_text_view.visible?).to be_truthy
  end
end
