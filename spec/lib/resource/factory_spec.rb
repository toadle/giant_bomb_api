require 'spec_helper'

describe GiantBombApi::Resource::Factory do

  let(:game_json) {{'api_detail_url' => 'http://www.giantbomb.com/api/game/3030-41693/', 'some' => 'data' }}
  let(:platform_json) {{'api_detail_url' => 'http://www.giantbomb.com/api/platform/3045-146/', 'some' => 'data' }}
  let(:unknown_json) {{'api_detail_url' => 'http://www.giantbomb.com/api/unknown/1234-567/', 'some' => 'data' }}

  describe '#init_resource_from' do
    context 'when a json with game-api-detail-url is given' do
      let(:game) { double('Game') }
      it 'initializes a GiantBombApi::Resource::Game and return it' do
        expect(GiantBombApi::Resource::Game).to receive(:new).with(game_json).and_return(game)
        expect(GiantBombApi::Resource::Factory.init_resource_from(game_json)).to eq game
      end
    end
    context 'when a json with platform-api-detail-url is given' do
      let(:platform) { double('Platform') }
      it 'initializes a GiantBombApi::Resource::Platform and return it' do
        expect(GiantBombApi::Resource::Platform).to receive(:new).with(platform_json).and_return(platform)
        expect(GiantBombApi::Resource::Factory.init_resource_from(platform_json)).to eq platform
      end
    end
    context 'when an unknow-json is given' do
      it 'will not fail and return nil' do
        expect(GiantBombApi::Resource::Factory.init_resource_from(unknown_json)).to be_nil
      end
    end
  end

end
