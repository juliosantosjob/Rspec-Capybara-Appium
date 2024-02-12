require_relative "../support/capy"
require_relative "../support/base_screen"
require_relative "../utils/helpers"

class LongPressScreen < BaseScreen
  include Helper

  element :btn_long_press, "xpath://android.widget.TextView[@content-desc='longPress']", "locator:ios"
  element :fld_title_long_press, "xpath://android.widget.TextView[@text='Long Press Demo']", "locator:ios"
  element :msg_ok, "xpath:(//android.widget.TextView)[2]", "locator:ios"

  def access_long_press_screen
    wait_and_tap(btn_long_press, 5)
    assert_visible(fld_title_long_press)
  end

  def do_a_long_press
    button_lps = find_element_by_platform(
      type_and: :accessibility_id, locator_and: "longpress",
      type_ios: :id, locator_ios: "longpress_ios"
    )
    long_press(button_lps)
  end

  def long_press_message(msg)
    assert_text(msg_ok, msg)
    assert_visible(msg_ok)
  end
end
