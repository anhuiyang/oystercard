require 'Oystercard'

describe Oystercard do
  let(:entry){double :station}
  let(:exit){double :station}

  context "defaul setting"  do
    describe "#balance" do
      it "expect default balance to be zero" do
        expect(subject.balance).to eq 0
      end
      it "expect to update card balance" do
        expect {subject.top_up(5)}.to change { subject.balance }.by 5
      end
      it "expect card history to be empty hash" do
        expect(subject.history).to be_empty
      end
    end
  end

  context "raise error situations"  do
    describe "#top_up"  do
      it "raises error when limit reached" do
        limit = Oystercard::MAX
        expect {subject.top_up(limit + 1 )}.to raise_error "Maximum balance £#{limit} exceeded"
      end
      it "raises error when balance under £1" do
        expect{subject.touch_in("aldgate")}.to raise_error "balance below £#{Oystercard::MIN}"
      end
    end
  end

  context "situation after top up"  do
    before do
      subject.top_up(10)
    end
    it {(is_expected).to(respond_to(:touch_in).with(1).argument)}
    it {(is_expected).to(respond_to(:touch_out).with(1).argument)}
    it "deduct balance when touch out" do
      subject.touch_in(entry)
      expect {subject.touch_out(exit)}.to change {subject.balance}.by -(Oystercard::MIN)
    end
    it "update journey history" do
      subject.touch_in(entry)
      subject.touch_out(exit)
      expect(subject.history).to eq [{entry => exit}]
    end
  end
end
