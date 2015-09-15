module GiantBombApi
  class Resource::Platform
    extend GiantBombApi::CollectionResource
    resource_attribute :abbreviation
    resource_attribute :company
    resource_attribute :deck
    resource_attribute :description
    resource_attribute :image
    resource_attribute :install_base
    resource_attribute :name
    resource_attribute :online_support
    resource_attribute :original_price
    resource_attribute :release_date
    resource_attribute :site_detail_url
  end
end