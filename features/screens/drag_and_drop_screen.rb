require_relative "../support/configs_capy"
require_relative "../utils/helpers"

class DragAndDropScreen < SitePrism::Page
  include Helper

  element :btn_drag_and_drop, :xpath, "//android.widget.TextView[@content-desc='dragAndDrop']"
  element :fld_title_drag_and_drop, :xpath, "//*[@text='Drag & Drop']"
  element :fld_msg_success, :accessibility_id, "success"

  def access_drag_and_drop_screen
    wait_and_tap(btn_drag_and_drop, 5)
    assert_visible(fld_title_drag_and_drop)
  end

  def select_drag
    el_dragme = $driver.find_element :accessibility_id, "dragMe"
    el_drop_here = $driver.find_element :xpath, "//android.widget.TextView[@text='Drop here.']"

    move_with_drag(el_dragme, el_drop_here)
  end

  def verify_success_message(msg)
    assert_text(fld_msg_success, msg)
  end
end
