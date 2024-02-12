require_relative "../support/capy"
require_relative "../support/base_screen"
require_relative "../utils/helpers"

class PhotoViewScreen < BaseScreen
  include Helper

  element :btn_photo_view, "xpath://android.widget.TextView[@content-desc='photoView']", "locator:ios"
  element :fld_title_photo_view, "xpath://*[contains(@text,'Photos - Ping & Zoom')]", "locator:ios"

  def access_photo_view_screen
    wait_and_tap(btn_photo_view, 5)
    assert_visible(fld_title_photo_view)
  end

  def successful_image_zoom
    img_photo_view = find_element_by_platform(
      type_and: :xpath, locator_and: "//android.widget.ImageView",
      type_ios: :id, locator_ios: "double_tap_ios"
    )

    # original_size = [img_photo_view.size.width, img_photo_view.size.height]
    # puts original_size

    # double_tap(img_photo_view) # Realiza o zoom
    # puts original_size

    # new_size = [img_photo_view.size.width, img_photo_view.size.height]
    # expect(new_size).not_to eq(original_size)
  end
end
