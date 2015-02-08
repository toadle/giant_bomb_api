module GiantBombApi
  class Resource::Platform
    extend GiantBombApi::Resource

    resource_attribute :api_detail_url, :id, :name, :abbreviation

  end
end