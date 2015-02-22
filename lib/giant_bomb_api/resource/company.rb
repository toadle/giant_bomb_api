module GiantBombApi
  class Resource::Company
    extend GiantBombApi::CollectionResource

    resource_attribute :abbreviation
    resource_attribute :aliases
    resource_attribute :api_detail_url
    resource_attribute :date_added
    resource_attribute :date_founded
    resource_attribute :date_last_updated
    resource_attribute :deck
    resource_attribute :description
    resource_attribute :id
    resource_attribute :image, resource_name: :image
    resource_attribute :location_address
    resource_attribute :location_city
    resource_attribute :location_country
    resource_attribute :location_state
    resource_attribute :name
    resource_attribute :phone
    resource_attribute :site_detail_url
    resource_attribute :website

    private

  end
end