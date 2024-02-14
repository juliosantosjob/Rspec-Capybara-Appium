require_relative "../support/capy"
require_relative "../support/base_screen"
require_relative "../utils/helpers"

class DoubleTapScreen < BaseScreen
  include Helper

  element :btn_drag_and_drop, "xpath://android.widget.TextView[@content-desc='doubleTap']", "locator:ios"
  element :fld_title_double_tap, "xpath://android.widget.TextView[@text='Double Tap Demo']", "locator:ios"
  element :msg_ok, "xpath:(//android.widget.TextView)[2]", "locator:ios"

  def access_double_tap_screen
    wait_and_tap(btn_drag_and_drop, 5)
    assert_visible(fld_title_double_tap)
  end

  def do_a_double_tap
    double_button = find_element_by_platform(
      type_and: :accessibility_id, locator_and: "doubleTapMe",
      type_ios: :id, locator_ios: "double_tap_ios"
    )
    
    double_tap(double_button)
  end

  def display_message(msg)
    assert_text(msg_ok, msg)
    assert_visible(msg_ok)
  end
end
