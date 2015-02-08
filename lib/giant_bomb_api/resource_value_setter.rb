module GiantBombApi
  module ResourceValueSetter

    def initialize(json)
      @json = json
      init_mapped_attributes_from(json)
      init_collection_attributes_from(json)
    end

    def init_mapped_attributes_from(hash)
      self.class.instance_variable_get("@mapped_attributes").each do |attribute|
        self.send("#{attribute}=", hash[attribute.to_s])
      end
    end

    def init_collection_attributes_from(hash)
      self.class.instance_variable_get("@collection_attributes").each do |attribute|
        attribute = attribute.to_s
        unless hash[attribute].nil?
          self.send("#{attribute}=", hash[attribute].map { |json| GiantBombApi::Resource::Factory.init_resource_from(json) }.compact)
        end
      end
    end

  end
end