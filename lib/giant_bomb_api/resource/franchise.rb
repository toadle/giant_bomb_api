module GiantBombApi
  class Resource::Franchise
    extend GiantBombApi::CollectionResource
    resource_attribute :aliases
    resource_attribute :characters
    resource_attribute :concepts
    resource_attribute :deck
    resource_attribute :description
    resource_attribute :games
    resource_attribute :image
    resource_attribute :locations
    resource_attribute :name
    resource_attribute :objects
    resource_attribute :people
    resource_attribute :site_detail_url
  end
end