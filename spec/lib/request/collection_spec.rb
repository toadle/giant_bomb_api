require 'spec_helper'

describe GiantBombApi::Request::Collection do
  describe "#initialize" do
    context "when only a resource is given" do
      it "sets query and the correct request_params" do
        collection_request = GiantBombApi::Request::Collection.new GiantBombApi::Resource::Game

        expect(collection_request.end_point).to eq "games"
        expect(collection_request.params).to eq({limit: 100, offset: 0})
      end
    end

    context "when a resource with filter is given" do
      it "sets query and the correct request_params" do
        collection_request = GiantBombApi::Request::Collection.new GiantBombApi::Resource::Game, filter: {name: "other", aliases: "something"}

        expect(collection_request.end_point).to eq "games"
        expect(collection_request.params).to eq(filter: "name:other,aliases:something", limit: 100, offset: 0)
      end
    end

    context "when a resource with filter and sort is given" do
      it "sets query and the correct request_params" do
        collection_request = GiantBombApi::Request::Collection.new GiantBombApi::Resource::Game, filter: {name: "other", aliases: "something"}, sort: {name: :desc}

        expect(collection_request.end_point).to eq "games"
        expect(collection_request.params).to eq(filter: "name:other,aliases:something", sort: "name:desc", limit: 100, offset: 0)
      end
    end
  end
end
