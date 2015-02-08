module GiantBombApi
  class Resource::Game
    extend GiantBombApi::Resource
    
    resource_attribute :aliases, :api_detail_url, :date_added, :date_last_updated
    resource_attribute :deck, :description, :expected_release_day, :expected_release_month
    resource_attribute :expected_release_quarter, :expected_release_year, :id, :name
    resource_attribute :number_of_user_reviews, :original_release_date
    resource_attribute :platforms
    resource_attribute :original_game_rating
    
  end
end
