require 'Station'

describe Station do

  station = Station.new(:name, :zone)
  it "return name"  do
    expect(station.name).to eq :name
  end
  it "return zone" do
    expect(station.zone).to eq :zone
  end
end
