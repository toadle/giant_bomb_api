module GiantBombApi
  class Resource::Promo
    extend GiantBombApi::CollectionResource
    resource_attribute :deck
    resource_attribute :image
    resource_attribute :link
    resource_attribute :name
    resource_attribute :resource_type
    resource_attribute :user
  end
end