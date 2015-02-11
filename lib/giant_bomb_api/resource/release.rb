module GiantBombApi
  class Resource::Release
    extend GiantBombApi::Resource

      resource_attribute :name
      resource_attribute :id

    private

  end
end