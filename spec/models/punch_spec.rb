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
end

