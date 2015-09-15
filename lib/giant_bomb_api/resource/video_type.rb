module GiantBombApi
  class Resource::VideoType
    extend GiantBombApi::CollectionResource
    resource_attribute :deck
    resource_attribute :name
    resource_attribute :site_detail_url
  end
end