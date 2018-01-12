require 'station'

describe Station do
  subject(:station) { described_class.new('angel', 1) }

    describe '#name' do

    it 'responds (station) to name method' do
      expect(station).to respond_to(:name)
    end

    it 'returns its name' do
      expect(station.name).to eq('angel')
    end

  end

  describe '#zone' do

    it 'responds (station) to zone method' do
      expect(station).to respond_to(:zone)
    end

    it 'returns its zone' do
      expect(station.zone).to eq(1)
    end

  end
end
