require 'spec_helper'

describe GiantBombApi::Request::Search do
  describe "#initialize" do
    context "when only a query is given" do
      it "sets query and the correct defaults as request_params" do
        search_request = GiantBombApi::Request::Search.new "query"

        expect(search_request.params).to eq({ query: "query",
                                              resources: "game",
                                              limit: 100,
                                              page: 1 })
      end
    end

    context "when a query and some resources are given" do
      it "maps the resources-class to resource-names and sets the correct request_params" do
        search_request = GiantBombApi::Request::Search.new "query", resources: [GiantBombApi::Resource::Game, GiantBombApi::Resource::Company, GiantBombApi::Resource::Character]

        expect(search_request.params).to eq({ query: "query",
                                              resources: "game,company,character",
                                              limit: 100,
                                              page: 1 })
      end
    end

    context "when a query, some resources and parameters are given" do
      it "sets the correct request_params" do
        search_request = GiantBombApi::Request::Search.new "query", resources: [GiantBombApi::Resource::Game, GiantBombApi::Resource::Company], limit: 50, page: 2

        expect(search_request.params).to eq({ query: "query",
                                              resources: "game,company",
                                              limit: 50,
                                              page: 2 })
      end
    end
  end
end
