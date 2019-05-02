require 'rails_helper'

describe Punch do |variable|
  describe "#associations" do
    it { should belong_to(:user) }
  end

  describe "#title" do
    it "returns the timestamp as formated string" do
      timestamp = DateTime.now
      punch = create(:punch, punched_at: timestamp)

      expect(punch.title).to eq timestamp.strftime(Punch::DATE_FORMAT)
    end
  end

  # Think about this a bit more
  # seems like we should remove the punch creation
  # from the context completely
  # it should focus on the user action more when punches are recorded
  # We need to think about punch controller only for editing and destroying

  context "#callbacks" do
    subject {create(:user)}

    it "should add punched_at" do
      last_punch = subject.punches.create

      expect(last_punch.punched_at).not_to be_nil
    end

    it "should store clock_in punch type when no punches exist" do
      last_punch = subject.punches.create

      expect(last_punch.punch_type).to eq(Punch::TYPES[:clock_in])
    end

    it "should store clock_in punch type when user is in clocked_out state" do
      subject.clock_in
      subject.reload # State needs to be updated in the instance created
      subject.clock_out

      last_punch = subject.punches.create

      expect(last_punch.punch_type).to eq(Punch::TYPES[:clock_in])
    end

    it "should store clock_out punch type when user is in clocked_in state" do
      subject.clock_in

      last_punch = subject.punches.create

      expect(last_punch.punch_type).to eq(Punch::TYPES[:clock_out])
    end

    it "should update user state to clocked_in when clock_in punch is created" do
      last_punch = subject.punches.create

      expect(subject.clocked_in?).to be true
    end

    it "should update user state to clocked_out when clock_out punch is created" do
    end

    it "should not allow future punhes" do
    end

    xit "should change user state when deleted" do
    end
  end
end

