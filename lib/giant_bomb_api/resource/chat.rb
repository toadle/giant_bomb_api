module GiantBombApi
  class Resource::Chat
    extend GiantBombApi::CollectionResource
    resource_name :channel_name
    resource_name :deck
    resource_name :image
    resource_name :password
    resource_name :site_detail_url
    resource_name :title
  end
end