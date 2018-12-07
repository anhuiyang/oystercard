require_relative '../lib/Journey'
describe "Journey" do
    journey = Journey.new("bank", "waterloo")
  it "return entry of a journey" do
    expect(journey.entry).to eq "bank"
  end
  it "return exit of a journey" do
    expect(journey.exit).to eq "waterloo"
  end
  it "return fare of a complete journey" do
    expect(journey.fare).to eq Journey::MIN
  end
  it "return penalty charge to a incomplete journey" do
    journey.entry = nil
    expect(journey.fare).to eq Journey::PENALTY
  end
end
