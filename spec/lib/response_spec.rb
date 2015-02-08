require 'spec_helper'

describe GiantBombApi::Response do

  let(:search_response) { JSON.parse File.read(File.join('spec', 'fixtures', 'search-response.json')) }
  let(:attributes_json) { { "limit" => "123", "offset" => "12", "number_of_page_results" => "1234", "number_of_total_results" => "4000"} }

  describe 'initialize' do
    context "when handed a search-result" do
      it 'sets the correct values on itself' do
        response = GiantBombApi::Response.new(search_response)

        expect(response.limit).to eq 100
        expect(response.offset).to eq 0
        expect(response.number_of_page_results).to eq 1
        expect(response.number_of_total_results).to eq 1
      end

      it 'creates the correct collection of objects' do
        response = GiantBombApi::Response.new(search_response)

        expect(response.results.count).to eq 1

        result = response.results.first

        expect(result).to be_a GiantBombApi::Resource::Game
        expect(result.aliases).to eq "Drive Club\r\n#DRIVECLUB"
        expect(result.api_detail_url).to eq "http://www.giantbomb.com/api/game/3030-41693/"
        expect(result.date_added).to eq "2013-02-20 15:57:29"
        expect(result.date_last_updated).to eq "2014-11-30 06:30:47"
        expect(result.deck).to eq "Driveclub is a team-based racing game from Evolution Studios for PlayStation 4."
        expect(result.description).to eq "<p style=\"\"> </p>"
        expect(result.expected_release_day).to be_nil
        expect(result.expected_release_month).to be_nil
        expect(result.expected_release_quarter).to be_nil
        expect(result.expected_release_year).to be_nil
        expect(result.id).to eq 41693
        expect(result.name).to eq "Driveclub"
        expect(result.number_of_user_reviews).to eq 0
        expect(result.original_release_date).to eq "2014-10-07 00:00:00"

        expect(result.platforms.count).to eq 1
        platform = result.platforms.first

        expect(platform).to be_a GiantBombApi::Resource::Platform
        expect(platform.api_detail_url).to eq "http://www.giantbomb.com/api/platform/3045-146/"
        expect(platform.id).to eq 146
        expect(platform.name).to eq "PlayStation 4"
        expect(platform.abbreviation).to eq "PS4"
      end
    end
  end

end
