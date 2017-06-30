require 'spec_helper'

describe GiantBombApi::CollectionResource do

  class DummyCollection
    extend GiantBombApi::CollectionResource
  end

  class AnotherDummyCollection
    extend GiantBombApi::CollectionResource

    collection_resource_name "some_dummy_collection"
  end

  describe 'extension' do
    it 'will also extend from GiantBombApi::Resource' do
      expect(DummyCollection).to be_a GiantBombApi::Resource
    end
  end

  describe '#collection_resource_name' do

    context "when in a class the collection_resource_name has been defined" do
      it 'returns the collection_resource_name of that class' do
        expect(AnotherDummyCollection.collection_resource_name).to eq "some_dummy_collection"
      end
    end

    context "when in a class the collection_resource_name has NOT been defined" do
      it 'returns the pluralized form of the resource_name' do
        expect(DummyCollection.collection_resource_name).to eq "dummy_collections"
      end
    end

  end

  describe 'query methods' do
    let(:client) { double("GiantBombApi::Client") }
    let(:dummy_collection_request) { double("DummyCollectionRequest") }
    let(:response) { double("GiantBombApi::Response") }

    before do
      allow(GiantBombApi).to receive(:client).and_return(client)
    end

    describe '#where' do
      context "when given NO additional attributes" do
        it 'will send a blank collection-request for itself' do
          expect(GiantBombApi::Request::Collection).to receive(:new).with(DummyCollection).and_return(dummy_collection_request)
          expect(client).to receive(:send_request).with(dummy_collection_request).and_return(response)
          expect(DummyCollection.where).to eq response
        end
      end

      context "when given a hash that does not contain :sort, :offset or :limit" do
        it 'will send a collection-request with the given has as a filter' do
          expect(GiantBombApi::Request::Collection).to receive(:new).with(DummyCollection, filter: { name: "something", aliases: "other" }).and_return(dummy_collection_request)
          expect(client).to receive(:send_request).with(dummy_collection_request).and_return(response)
          expect(DummyCollection.where(name: "something", aliases: "other")).to eq response
        end
      end

      context "when given a hash that contains :sort, :offset and :limit" do
        it 'will send a collection-request with the the parameters assorted correctly' do
          expect(GiantBombApi::Request::Collection).to receive(:new).with(DummyCollection, filter: { name: "something", aliases: "other" }, sort: {something: :desc}, limit: 10, offset: 1).and_return(dummy_collection_request)
          expect(client).to receive(:send_request).with(dummy_collection_request).and_return(response)
          expect(DummyCollection.where(name: "something", aliases: "other", sort: {something: :desc}, limit: 10, offset: 1)).to eq response
        end
      end
    end

    describe '#each_page' do
      it 'will continually retrieve the next page until there are no more results' do
        expect(DummyCollection).to receive(:where).and_return(dummy_collection_request).exactly(5).times
        allow(dummy_collection_request).to receive(:has_more_results?).and_return(true)

        times = 0
        DummyCollection.each_page do |page|
          times += 1
          if times == 5
            allow(dummy_collection_request).to receive(:has_more_results?).and_return(false)
          end
        end
      end

      context 'with should_rate_limit set to true' do
        it 'will rate limit the calls so that there are not more than 200 per hour' do
          expect(DummyCollection).to receive(:where).and_return(dummy_collection_request).exactly(3).times
          allow(dummy_collection_request).to receive(:has_more_results?).and_return(true)
          expect(DummyCollection).to receive(:sleep).twice

          times = 0
          DummyCollection.each_page(should_rate_limit: true) do |page|
            times += 1
            if times == 3
              allow(dummy_collection_request).to receive(:has_more_results?).and_return(false)
            end
          end
        end
      end
    end
  end
end
