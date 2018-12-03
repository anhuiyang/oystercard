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

 describe '#deduct' do
  it "balanced to be deducted £5.35" do
    subject.top_up(30)
    subject.deduct
    expect(subject.balance).to eq 24.65
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
end
