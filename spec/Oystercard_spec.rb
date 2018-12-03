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
      limit = Oystercard::LIMIT
      subject.top_up(limit)
      exceed = subject.balance + 1 - limit
      expect {subject.top_up(1)}.to raise_error "Maximum balance £90 exceeded by #{exceed}"
   end
 end

 describe '#deduct' do
  it "balanced to be deducted £5" do
    subject.top_up(30)
    subject.deduct(5)
    expect(subject.balance).to eq 25
  end
 end

 describe '#touch_in' do
   it {is_expected.to respond_to :touch_in}
 end
   it "will change status to in journey" do
     subject.touch_in
     expect(subject.in_journey?).to eq true
   end

 describe '#touch_out' do
   it {is_expected.to respond_to :touch_out}
   it "will change status to not in journey" do
     subject.touch_out
     expect(subject.in_journey?).to eq false
   end
 end

 describe '#in_journey?' do
   it "is default to not in journey" do
     expect(subject.in_journey?).to eq false
   end
 end
end
