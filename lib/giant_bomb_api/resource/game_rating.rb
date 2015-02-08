module GiantBombApi
  class Resource::GameRating
    extend GiantBombApi::Resource
    
    resource_attribute :api_detail_url
    resource_attribute :id
    resource_attribute :name
    
  end
end
