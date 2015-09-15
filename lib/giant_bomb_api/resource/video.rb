module GiantBombApi
  class Resource::Video
    extend GiantBombApi::CollectionResource
    resource_attribute :deck
    resource_attribute :hd_url
    resource_attribute :high_url
    resource_attribute :image
    resource_attribute :length_seconds
    resource_attribute :low_url
    resource_attribute :name
    resource_attribute :publish_date
    resource_attribute :site_detail_url
    resource_attribute :url
    resource_attribute :user
    resource_attribute :youtube_id
  end
end