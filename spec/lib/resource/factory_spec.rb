require 'spec_helper'

describe GiantBombApi::Resource::Factory do

  let(:game_json) {{'api_detail_url' => 'http://www.giantbomb.com/api/game/3030-41693/', 'some' => 'data' }}
  let(:unknown_json) {{'api_detail_url' => 'http://www.giantbomb.com/api/unknown/1234-567/', 'some' => 'data' }}
  let(:image_json) {{"icon_url": "http://url","medium_url": "http://url2","screen_url": "http://url3"}}

  describe '#init_resource_from' do
    context "when a json without resource_name is given" do
      context 'and a api_detail_url is present' do
        let(:game) { double('Game') }
  
        it 'initializes the object based on the found resource_name in the api_detail_url' do
          expect(GiantBombApi::Resource::Game).to receive(:new).with(game_json).and_return(game)
          expect(GiantBombApi::Resource::Factory.init_resource_from(game_json)).to eq game
        end
  
        context 'and an unknown-resource-name is discovered' do
          it 'will not fail and return nil' do
            expect(GiantBombApi::Resource::Factory.init_resource_from(unknown_json)).to be_nil
          end
        end
      end
    end
    context "when a json with resource_name is given" do
      let(:image) { double('Image') }
      it 'initializes the object based on the given resource_name' do
        expect(GiantBombApi::Resource::Image).to receive(:new).with(image_json).and_return(image)
        expect(GiantBombApi::Resource::Factory.init_resource_from(image_json, :image)).to eq image
      end
    end
  end

end
