module GiantBombApi
  class Resource::RatingBoard
    extend GiantBombApi::CollectionResource
    resource_attribute :deck
    resource_attribute :description
    resource_attribute :image
    resource_attribute :name
    resource_attribute :region
    resource_attribute :site_detail_url
  end
end