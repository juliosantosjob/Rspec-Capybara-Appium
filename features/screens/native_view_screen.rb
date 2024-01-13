require_relative "../support/env"

class NativeViewScreen < SitePrism::Page
  element :chained_view, :xpath, "//*[@content-desc='chainedView']", :text => "Native View"
end
