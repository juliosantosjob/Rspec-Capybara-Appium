require_relative "../support/capy"
require_relative "../utils/helpers"

class DragAndDropScreen
  include Helper

  def access_drag_and_drop_screen
    title = find_element($drag_and_drop_elements["fld_title_drag_and_drop"])

    find_element($drag_and_drop_elements["btn_drag_and_drop"]).click
    expect(title.visible?).to be_truthy
  end

  def select_drag
    el_dragme = find_by_appium($drag_and_drop_elements["fld_drag_me"])
    el_drop_here = find_by_appium($drag_and_drop_elements["fld_drop_here"])

    move_with_drag(el_dragme, el_drop_here)
  end

  def verify_success_message(msg)
    fld_msg_success = find_by_appium($drag_and_drop_elements["fld_msg_success"])
    expect(fld_msg_success.text).to eq(msg)
  end
end
