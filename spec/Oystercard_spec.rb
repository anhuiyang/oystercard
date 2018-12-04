require 'Oystercard'

describe Oystercard do

  it "expect default balance to be zero" do
    expect(subject.balance).to eq 0
  end

  describe '#top_up' do
    it "expect to update card balance" do
      expect {subject.top_up(5)}.to change { subject.balance }.by 5
    end
    it "raises error when limit reached" do
      limit = Oystercard::MAX
      subject.top_up(limit)
      expect {subject.top_up(1)}.to raise_error "Maximum balance £#{limit} exceeded"
   end
 end

 describe '#touch_in' do
   it "raises error when balance under £1" do
     expect{subject.touch_in}.to raise_error "balance below £1"
   end

   it "will change status to in journey" do
     subject.top_up(10)
     subject.touch_in
     expect(subject.in_journey?).to eq true
   end
 end

 describe '#touch_out' do
   it "deduct balance when touch out" do
     expect {subject.touch_out}.to change {subject.balance}.by(-Oystercard::MIN)
   end
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
