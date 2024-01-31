require_relative "../support/configs_capy"
require_relative "../utils/helpers"

class DoubleTapScreen < SitePrism::Page
  include Helper

  element :btn_double_tap, :xpath, "//android.widget.TextView[@content-desc='doubleTap']"
  element :fld_title_drag_double_tao, :xpath, "//android.widget.TextView[@text='Double Tap Demo']"
  element :msg_success, :id, "android:id/message"

  def access_double_tap_screen
    wait_and_tap(btn_double_tap, 5)
    assert_visible(fld_title_drag_double_tao)
  end

  def do_double_tap
    element = Capybara.current_session.driver.appium_driver.find_element :xpath, "//android.widget.TextView[@text='Double Tap Me']"

    Capybara.current_session.driver.move_to(element).double_click.perform

    sleep 5
  end

  def se_message(text)
    assert_text(msg_success, text)
  end
end
