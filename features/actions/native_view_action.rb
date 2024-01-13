require_relative "../utils/helpers"
require_relative "../screens/native_view_screen"

class NativeViewActions < NativeViewScreen
  include Helper

  def go_native_view_screen
    wait_and_tap(chained_view, 5)
  end
end
