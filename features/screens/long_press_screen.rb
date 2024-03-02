require_relative "../support/capy"
require_relative "../utils/helpers"

class LongPressScreen
  include Helper

  def access_long_press_screen
    find_element($long_press_elements["btn_long_press"]).click

    title = find_element($long_press_elements["fld_title_long_press"])
    expect(title.visible?).to be_truthy
  end

  def do_a_long_press
    button_lps = find_by_appium($long_press_elements["fld_long_press"])
    long_press(button_lps)
  end

  def long_press_message(msg)
    get_msg = find_element($long_press_elements["msg_ok"])

    expect(get_msg.text).to eq(msg)
    expect(get_msg.visible?).to be_truthy
  end
end
