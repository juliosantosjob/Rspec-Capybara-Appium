require_relative "capy"

class BaseScreen < SitePrism::Page
  include SitePrism::DSL
  @@selector = { ANDROID: :id, IOS: :predicate, ANDROID_CLOUD: :id, IOS_CLOUD: :predicate }

  def self.get_default_selector(platform)
    case platform.downcase
    when "android", "android_cloud"
      return @@selector[:ANDROID]
    when "ios", "ios_cloud"
      return @@selector[:IOS]
    else
      raise ArgumentError, "Wrong Platform name"
    end
  end

  def self.set_default_selector(android, ios, android_cloud, ios_cloud)
    @@selector = { ANDROID: android, IOS: ios, ANDROID_CLOUD: android_cloud, IOS_CLOUD: ios_cloud }
  end

  def self.find_platform_locator(*find_args)
    platform = ENV["PLATFORM"].upcase
    if (find_args.length == 2) && platform.include?("ANDROID")
      find_args.delete_at(1)
    elsif (find_args.length == 2) && platform.include?("IOS")
      find_args.delete_at(0)
    end

    if find_args[0].split(":").length == 2
      selectors = find_args[0].split(":")
      return selectors[0].to_sym, selectors[1]
    else
      return [BaseScreen.get_default_selector(platform), find_args[0]]
    end
  end

  def self.element(name, *find_args)
    m_find_args = find_platform_locator(*find_args)
    super(name, *m_find_args)
  end

  def self.elements(name, *find_args)
    m_find_args = find_platform_locator(*find_args)
    super(name, *m_find_args)
  end
end
