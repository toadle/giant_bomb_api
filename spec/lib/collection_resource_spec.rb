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

  describe '#where' do
    let(:client) { double("GiantBombApi::Client") }
    before do 
      allow(GiantBombApi).to receive(:client).and_return(client)
    end

    context "when given NO additional attributes" do
      let(:dummy_collection_request) { double("DummyCollectionRequest") }
      let(:response) { double("GiantBombApi::Response") }

      it 'will send a blank collection-request for itself' do
        expect(GiantBombApi::Request::Collection).to receive(:new).with(DummyCollection).and_return(dummy_collection_request)
        expect(client).to receive(:send_request).with(dummy_collection_request).and_return(response)
        expect(DummyCollection.where).to eq response
      end
    end
    context "when given a hash that does not contain :sort, :offset or :limit" do
      let(:dummy_collection_request) { double("DummyCollectionRequest") }
      let(:response) { double("GiantBombApi::Response") }

      it 'will send a collection-request with the given has as a filter' do
        expect(GiantBombApi::Request::Collection).to receive(:new).with(DummyCollection, filter: { name: "something", aliases: "other" }).and_return(dummy_collection_request)
        expect(client).to receive(:send_request).with(dummy_collection_request).and_return(response)
        expect(DummyCollection.where(name: "something", aliases: "other")).to eq response
      end
    end

    context "when given a hash that contains :sort, :offset and :limit" do
      let(:dummy_collection_request) { double("DummyCollectionRequest") }
      let(:response) { double("GiantBombApi::Response") }

      it 'will send a collection-request with the the parameters assorted correctly' do
        expect(GiantBombApi::Request::Collection).to receive(:new).with(DummyCollection, filter: { name: "something", aliases: "other" }, sort: {something: :desc}, limit: 10, offset: 1).and_return(dummy_collection_request)
        expect(client).to receive(:send_request).with(dummy_collection_request).and_return(response)
        expect(DummyCollection.where(name: "something", aliases: "other", sort: {something: :desc}, limit: 10, offset: 1)).to eq response
      end
    end
  end

end
