module GiantBombApi
  class Resource::Theme
    extend GiantBombApi::CollectionResource
    resource_attribute :name
    resource_attribute :site_detail_url
  end
end