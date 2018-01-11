require 'station'

describe Station do
  subject(:station) { described_class.new('angel', 1) }

  it 'returns its name' do
    expect(station.name).to eq('angel')
  end

  it 'returns its zone' do
    expect(station.zone).to eq(1)
  end
end
