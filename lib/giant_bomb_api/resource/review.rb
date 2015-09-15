module GiantBombApi
  class Resource::Review
    extend GiantBombApi::CollectionResource
    resource_attribute :deck
    resource_attribute :description
    resource_attribute :dlc_name
    resource_attribute :game
    resource_attribute :platforms
    resource_attribute :publish_date
    resource_attribute :release
    resource_attribute :reviewer
    resource_attribute :score
    resource_attribute :site_detail_url
  end
end