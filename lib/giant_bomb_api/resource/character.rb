module GiantBombApi
  class Resource::Character
    extend GiantBombApi::CollectionResource

    resource_attribute :aliases
    resource_attribute :api_detail_url
    resource_attribute :birthday
    resource_attribute :date_added
    resource_attribute :date_last_updated
    resource_attribute :deck
    resource_attribute :description
    resource_attribute :gender
    resource_attribute :id
    resource_attribute :image, resource_name: :image
    resource_attribute :last_name
    resource_attribute :name
    resource_attribute :real_name
    resource_attribute :site_detail_url
    resource_attribute :first_appeared_in_game, resource_name: :game

    private

  end
end