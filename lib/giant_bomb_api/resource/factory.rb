module GiantBombApi
  class Resource::Factory

    def self.init_resource_from(json, attribute_name: nil, resource_name: nil)
      resource_name ||= discover_resource_name(json["api_detail_url"])
      resource_name ||= attribute_name if resource_exists?(attribute_name)
      resource_name ||= attribute_name.to_s.singularize if resource_exists?(attribute_name.to_s.singularize)
      return if resource_name.nil?

      init_object(resource_name, json)
    end

    def self.init_object(resource_name, json)
      if resource_exists? resource_name
        constant_for(resource_name).constantize.new(json)
      end
    end

    def self.discover_resource_name(string)
      return unless string
      match_data = string.match("/api/(?<resource_name>[a-z_]*)/")
      return if match_data.nil?
      return match_data["resource_name"]
    end

    def self.resource_exists?(resource_name)
      return false unless resource_name.present?
      Object.const_defined? constant_for(resource_name)
    end

    def self.constant_for(resource_name)
      "GiantBombApi::Resource::#{resource_name.to_s.classify}"
    end

  end
end