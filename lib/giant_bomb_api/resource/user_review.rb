module GiantBombApi
  class Resource::UserReview
    extend GiantBombApi::CollectionResource
    resource_attribute :deck
    resource_attribute :description
    resource_attribute :game
    resource_attribute :reviewer
    resource_attribute :score
    resource_attribute :site_detail_url
  end
end