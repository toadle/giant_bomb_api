module GiantBombApi
  class Resource::GameRating
    extend GiantBombApi::CollectionResource
    resource_attribute :image
    resource_attribute :name
    resource_attribute :rating_board
  end
end
