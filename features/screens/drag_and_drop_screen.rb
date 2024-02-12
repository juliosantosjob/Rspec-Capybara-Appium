require_relative "../support/capy"
require_relative "../support/base_screen"
require_relative "../utils/helpers"

class DragAndDropScreen < BaseScreen
  include Helper

  element :btn_drag_and_drop, "xpath://android.widget.TextView[@content-desc='dragAndDrop']"
  element :fld_title_drag_and_drop, "xpath://*[@text='Drag & Drop']"
  element :fld_msg_success, "accessibility_id:success"

  def access_drag_and_drop_screen
    wait_and_tap(btn_drag_and_drop, 5)
    assert_visible(fld_title_drag_and_drop)
  end

  def select_drag
    el_dragme = find_element_by_platform(
      type_and: :accessibility_id, locator_and: "dragMe",
      type_ios: :id, locator_ios: "dragme_ios"
    )

    el_drop_here = find_element_by_platform(
      type_and: :xpath, locator_and: "//android.widget.TextView[@text='Drop here.']",
      type_ios: :id, locator_ios: "drop_here_ios"
    )

    move_with_drag(el_dragme, el_drop_here)
  end

  def verify_success_message(msg)
    assert_text(fld_msg_success, msg)
  end
end
