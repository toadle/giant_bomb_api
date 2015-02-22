require 'active_support/core_ext/object'

module GiantBombApi
  class Response
    extend GiantBombApi::Resource

    attr_accessor :request
    resource_attribute :limit, :offset, :number_of_page_results, :number_of_total_results, :results

    def has_more_results?
      offset + number_of_page_results < number_of_total_results
    end

    private

  end
end