require 'spec_helper'

describe GiantBombApi::Resource::Game do

  let(:games_detail_response) { JSON.parse File.read(File.join('spec', 'fixtures', 'detail-response.json')) }

  describe '#initialize' do
    it 'correctly builds an object hierachy for a detail-json' do
      game = GiantBombApi::Resource::Game.new games_detail_response["results"]

      expect(game.name).to eq "Driveclub"
      expect(game.image).to be_present
      expect(game.original_game_rating.count).to eq 2
      expect(game.platforms.count).to eq 1
      expect(game.images.count).to eq 30
      expect(game.videos.count).to eq 5
      expect(game.developers.count).to eq 1
      expect(game.genres.count).to eq 1
      expect(game.franchises).to be_nil
      expect(game.publishers.count).to eq 2
      expect(game.releases.count).to eq 4
      expect(game.similar_games.count).to eq 1

    end

  end

end
