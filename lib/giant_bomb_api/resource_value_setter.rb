module GiantBombApi
  module ResourceValueSetter

    def initialize(json)
      @json = json
      init_resource_attributes_from(json)
    end

    def init_resource_attributes_from(hash)
      self.class.instance_variable_get("@resource_attributes").each do |attribute|
        attribute = attribute.to_s

        hash_value = hash[attribute]
        value = nil
        
        unless hash_value.nil?
          if hash_value.is_a? Hash
            value = GiantBombApi::Resource::Factory.init_resource_from(hash_value)
          elsif hash_value.is_a? Array
            value = hash_value.map { |json| GiantBombApi::Resource::Factory.init_resource_from(json) }.compact
          else
            value = hash_value
          end
        end

        self.send("#{attribute}=", value)
      end
    end

  end
end