module GiantBombApi
  class Resource::Game
    extend GiantBombApi::CollectionResource
    
    resource_attribute :aliases, :api_detail_url, :date_added, :date_last_updated
    resource_attribute :deck, :description, :expected_release_day, :expected_release_month
    resource_attribute :expected_release_quarter, :expected_release_year, :id, :name
    resource_attribute :number_of_user_reviews, :original_release_date
    
    resource_attribute :image, resource_name: :image
    resource_attribute :images, resource_name: :image
    resource_attribute :videos
    resource_attribute :developers
    resource_attribute :platforms
    resource_attribute :genres
    resource_attribute :franchises
    resource_attribute :publishers
    resource_attribute :releases
    resource_attribute :similar_games, resource_name: :game
    resource_attribute :original_game_rating
    
  end
end
