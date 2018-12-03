require 'Oystercard'
describe Oystercard do
  it "expect default balance to be zero" do
    expect(subject.balance).to eq 0
  end
  describe '#top_up' do
    it "expect to update card balance" do
      subject.top_up(5)
      expect(subject.balance).to eq 5
    end
  end
end
