require_relative "../support/capy"
require_relative "../support/base_page"
require_relative "../utils/helpers"

class NativeViewScreen < BasePage
  include Helper

  element :btn_chained_view, "xpath://android.widget.TextView[@content-desc='chainedView']", "locator:ios"
  element :fld_title_native_view, "xpath://*[contains(@text,'Native View Demo')]", "locator:ios"
  element :fld_first_text_view, "xpath:(//android.widget.TextView[@content-desc='textView'])[1]", "locator:ios"
  element :fld_second_text_view, "xpath:(//android.widget.TextView[@content-desc='textView'])[2]", "locator:ios"
  element :fld_third_text_view, "xpath:(//android.widget.TextView[@content-desc='textView'])[3]", "locator:ios"

  def access_native_view_screen
    wait_and_tap(btn_chained_view, 5)
    assert_visible(fld_title_native_view)
  end

  def see_text_view(txt)
    all_text_views = [
      fld_first_text_view,
      fld_second_text_view,
      fld_third_text_view
    ]
    current_text_view = all_text_views.find { |element| element.text.include?(txt) }
    assert_visible(current_text_view)
  end
end
