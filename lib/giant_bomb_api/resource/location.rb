module GiantBombApi
  class Resource::Location
    extend GiantBombApi::CollectionResource
    resource_attribute :aliases
    resource_attribute :deck
    resource_attribute :description
    resource_attribute :first_appeared_in_game, resource_name: :game
    resource_attribute :image
    resource_attribute :name
    resource_attribute :site_detail_url
  end
end