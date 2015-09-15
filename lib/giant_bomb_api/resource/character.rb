module GiantBombApi
  class Resource::Character
    extend GiantBombApi::CollectionResource
    resource_attribute :aliases
    resource_attribute :birthday
    resource_attribute :concepts
    resource_attribute :deck
    resource_attribute :description
    resource_attribute :enemies
    resource_attribute :first_appeared_in_game, resource_name: :game
    resource_attribute :franchises
    resource_attribute :friends
    resource_attribute :games
    resource_attribute :gender
    resource_attribute :image
    resource_attribute :last_name
    resource_attribute :locations
    resource_attribute :name
    resource_attribute :objects
    resource_attribute :people
    resource_attribute :real_name
    resource_attribute :site_detail_url
  end
end