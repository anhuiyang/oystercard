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
    it "raises error when limit reached" do
      subject.top_up(90)
      exceed = subject.balance + 1 - Oystercard::LIMIT
      expect {subject.top_up(1)}.to raise_error "Maximum balance exceeded by #{exceed}"
   end
 end
end
