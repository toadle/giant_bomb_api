require 'spec_helper'

describe GiantBombApi do

  before do
    GiantBombApi.configure do |config|
      config.api_key = "12345"
    end
  end

  after do
    GiantBombApi.configuration = nil
  end

  describe "#configure" do

    it "will correctly retain it's configuration" do
      expect(GiantBombApi.configuration.api_key).to eq "12345"
    end
  end

  describe '#search' do
    let(:search_request) { double() }
    let(:result) { double() }

    it 'uses the modules default client to send a Request::Search at returns the result' do
      expect(GiantBombApi::Request::Search).to receive(:new).with("query").and_return(search_request)
      expect(GiantBombApi.client).to receive(:send_request).with(search_request).and_return(result)

      expect(GiantBombApi.search("query")).to eq result
    end
  end

  describe "#client" do

    context "when correctly configured first" do
      let(:client) { double("GiantBombApi::Client") }

      it "will use the module-config to configure a client and returns it" do
        expect(GiantBombApi::Client).to receive(:new).with(api_key: "12345").and_return(client)
        expect(GiantBombApi.client).to eq client
      end
    end
    
    context "when not configured first" do
      before do
        GiantBombApi.configuration = nil
      end

      it "will raise an error and asks to configure first" do
        expect{GiantBombApi.client}.to raise_error(GiantBombApi::Exception)
      end
    end
  end

end
