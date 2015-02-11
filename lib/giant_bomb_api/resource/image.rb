module GiantBombApi
  class Resource::Image
    extend GiantBombApi::Resource

      resource_attribute :icon_url
      resource_attribute :medium_url
      resource_attribute :screen_url
      resource_attribute :small_url
      resource_attribute :super_url
      resource_attribute :thumb_url
      resource_attribute :tiny_url

    private

  end
end