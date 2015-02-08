module GiantBombApi
  class Resource::Game
    extend GiantBombApi::Resource
    
    mapped_attribute :aliases, :api_detail_url, :date_added, :date_last_updated
    mapped_attribute :deck, :description, :expected_release_day, :expected_release_month
    mapped_attribute :expected_release_quarter, :expected_release_year, :id, :name
    mapped_attribute :number_of_user_reviews, :original_release_date

    collection_attribute :platforms
  end
end
