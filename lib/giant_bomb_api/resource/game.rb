module GiantBombApi
  class Resource::Game
    extend GiantBombApi::CollectionResource
    resource_attribute :aliases
    resource_attribute :characters
    resource_attribute :concepts
    resource_attribute :deck
    resource_attribute :description
    resource_attribute :developers, resource_name: :company
    resource_attribute :expected_release_day
    resource_attribute :expected_release_month
    resource_attribute :expected_release_quarter
    resource_attribute :expected_release_year
    resource_attribute :first_appearance_characters, resource_name: :character
    resource_attribute :first_appearance_concepts, resource_name: :concept
    resource_attribute :first_appearance_locations, resource_name: :location
    resource_attribute :first_appearance_objects
    resource_attribute :first_appearance_people
    resource_attribute :franchises
    resource_attribute :genres
    resource_attribute :image
    resource_attribute :images
    resource_attribute :killed_characters, resource_name: :character
    resource_attribute :locations
    resource_attribute :name
    resource_attribute :number_of_user_reviews
    resource_attribute :objects
    resource_attribute :original_game_rating
    resource_attribute :original_release_date
    resource_attribute :people
    resource_attribute :platforms
    resource_attribute :publishers, resource_name: :company
    resource_attribute :releases
    resource_attribute :reviews
    resource_attribute :similar_games, resource_name: :game
    resource_attribute :site_detail_url
    resource_attribute :themes
    resource_attribute :videos
  end
end
