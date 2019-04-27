require 'rails_helper'

describe User, type: :model do

  subject { build(:user, first_name: 'John', last_name: 'Doe') }

  describe "#associations" do
    it { should have_many(:state_changes) }
    it { should have_many(:punches) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe "#factory" do
    it "should be valid" do
      expect(subject).to be_valid
    end
  end

  describe "#name" do
    it "should return full name of user" do
      expect(subject.name).to eq("John Doe")
    end
  end

  context "when a user is created" do
    it "should generate a passcode" do
      expect(subject.generate_passcode).to_not eq(nil)
    end
  end
end
