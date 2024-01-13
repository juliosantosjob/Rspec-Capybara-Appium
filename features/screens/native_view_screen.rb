require_relative "../support/env"
require_relative "../utils/helpers"

class NativeViewScreen < SitePrism::Page
  include Helper

  element :btn_chained_view, :xpath, "//*[@content-desc='chainedView']", :text => "Native View"
  element :fld_title_native_view, :xpath, "//*[contains(@text,'Native View Demo')]"
  element :fld_first_text_view, :xpath, "(//android.widget.TextView[@content-desc='textView'])[1]"
  element :fld_second_text_view, :xpath, "(//android.widget.TextView[@content-desc='textView'])[2]"
  element :fld_third_text_view, :xpath, "(//android.widget.TextView[@content-desc='textView'])[3]"

  def go_native_view_screen
    wait_and_tap(btn_chained_view, 5)
    expect(fld_title_native_view.visible?).to be_truthy
  end

  def see_text_view(txt)
    elements = [fld_first_text_view, fld_second_text_view, fld_third_text_view]
    matching_element = elements.find { |element| element.text.include?(txt) }
    expect(matching_element).to be_truthy, "Error Text '#{txt}' not found in any of the elements."
  end
end
