module GiantBombApi
  class Resource::Company
    extend GiantBombApi::CollectionResource
    resource_attribute :abbreviation
    resource_attribute :aliases
    resource_attribute :characters
    resource_attribute :concepts
    resource_attribute :date_last_updated
    resource_attribute :deck
    resource_attribute :description
    resource_attribute :developed_games, resource_name: :game
    resource_attribute :developer_releases, resource_name: :release
    resource_attribute :distributor_releases, resource_name: :release
    resource_attribute :image
    resource_attribute :location_address
    resource_attribute :location_city
    resource_attribute :location_country
    resource_attribute :location_address
    resource_attribute :location_city
    resource_attribute :location_country
    resource_attribute :location_state
    resource_attribute :locations
    resource_attribute :name
    resource_attribute :objects
    resource_attribute :people
    resource_attribute :phone
    resource_attribute :published_games, resource_name: :game
    resource_attribute :publisher_releases, resource_name: :release
    resource_attribute :site_detail_url
    resource_attribute :website
  end
end