module GiantBombApi
  class Resource::Genre
    extend GiantBombApi::Resource

      resource_attribute :name
      resource_attribute :id

    private

  end
end