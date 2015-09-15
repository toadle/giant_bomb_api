module GiantBombApi
  class Resource::Release
    extend GiantBombApi::CollectionResource
    resource_attribute :deck
    resource_attribute :description
    resource_attribute :developers, resource_name: :company
    resource_attribute :expected_release_day
    resource_attribute :expected_release_month
    resource_attribute :expected_release_quarter
    resource_attribute :expected_release_year
    resource_attribute :game
    resource_attribute :game_rating
    resource_attribute :image
    resource_attribute :images
    resource_attribute :name
    resource_attribute :platform
    resource_attribute :product_code_type
    resource_attribute :product_code_value
    resource_attribute :publishers, resource_name: :company
    resource_attribute :region
    resource_attribute :release_date
    resource_attribute :site_detail_url
  end
end