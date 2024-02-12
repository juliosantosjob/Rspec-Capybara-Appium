require_relative "../support/capy"
require_relative "../support/base_screen"
require_relative "../utils/helpers"

class LongPressScreen < BasePage
  include Helper

  element :btn_long_press, "xpath://android.widget.TextView[@content-desc='longPress']", "locator:ios"
  element :fld_title_long_press, "xpath://android.widget.TextView[@text='Long Press Demo']", "locator:ios"l

  def access_long_press_screen
    wait_and_tap(btn_long_press, 5)
    assert_visible(fld_title_long_press)
  end
end
