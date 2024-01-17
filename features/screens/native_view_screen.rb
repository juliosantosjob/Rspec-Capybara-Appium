require "rspec"
require_relative "../support/env"
require_relative "../utils/helpers"

class NativeViewScreen < SitePrism::Page
  include Capybara::DSL
  include RSpec::Matchers
  include Helper

  element :btn_chained_view, :xpath, "//*[@content-desc='chainedView']", :text => "Native View"
  element :fld_title_native_view, :xpath, "//*[contains(@text,'Native View Demo')]"
  element :fld_first_text_view, :xpath, "(//android.widget.TextView[@content-desc='textView'])[1]"
  element :fld_second_text_view, :xpath, "(//android.widget.TextView[@content-desc='textView'])[2]"
  element :fld_third_text_view, :xpath, "(//android.widget.TextView[@content-desc='textView'])[3]"

  def access_native_view_screen
    wait_and_tap(btn_chained_view, 5)
    expect(fld_title_native_view.visible?).to be_truthy
  end

  def see_text_view(txt)
    all_elements = [
      fld_first_text_view,
      fld_second_text_view,
      fld_third_text_view
    ]
    text_view = all_elements.find { |element| element.text.include?(txt) }
    expect(text_view).to be_truthy
  end
end
