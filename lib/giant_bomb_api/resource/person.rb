module GiantBombApi
  class Resource::Person
    extend GiantBombApi::CollectionResource
    resource_attribute :aliases
    resource_attribute :birth_date
    resource_attribute :characters
    resource_attribute :concepts
    resource_attribute :country
    resource_attribute :death_date
    resource_attribute :deck
    resource_attribute :description
    resource_attribute :first_credited_game, resource_name: :game
    resource_attribute :franchises
    resource_attribute :games
    resource_attribute :gender
    resource_attribute :hometown
    resource_attribute :image
    resource_attribute :locations
    resource_attribute :name
    resource_attribute :objects
    resource_attribute :people
    resource_attribute :site_detail_url
  end
end