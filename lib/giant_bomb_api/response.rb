module GiantBombApi
  class Response
    attr_reader :results

    def initialize(json)
      @json = json
      init_results
    end

    def limit
      @json["limit"]
    end

    def offset
      @json["offset"]
    end

    def number_of_page_results
      @json["number_of_page_results"]
    end

    def number_of_total_results
      @json["number_of_total_results"]
    end

    def json
      JSON.pretty_generate(@json)
    end

    private

    def init_results
      @results = @json["results"].map { |json| Resource::Factory.init_resource_from(json) }
    end
    
  end
end