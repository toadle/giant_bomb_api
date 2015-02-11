module GiantBombApi
  class Resource::Video
    extend GiantBombApi::Resource

      resource_attribute :name
      resource_attribute :site_detail_url
      resource_attribute :id

    private

  end
end