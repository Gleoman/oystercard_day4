require 'station'

describe Station do
  subject(:station) { described_class.new("station", "zone") }

    it "expects station to return a station name" do
    expect(station.name).not_to be_empty
  end

    it "expects station to return a zone" do
    expect(station.zone).not_to be_empty
  end

end
