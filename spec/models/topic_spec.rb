require 'rails_helper'

RSpec.describe Topic, type: :model do
  describe "creating a topic" do
    let(:user) { create :user }
    let(:topic) { create :topic, user: user }

    describe "making a title" do
      it "is valid between 3 and 20 characters" do
        topic = Topic.new(title: "Hoi!")
        topic.valid?
      end

      it "is invalid over 20 characters" do
        topic = Topic.new(title: "Hoi! This is just a test to see if it exceeds the 20 characters.")
        topic.valid?
        expect(topic.errors).to have_key(:title)
      end

      it "is invalid below 2 characters" do
        topic = Topic.new(title: "H")
        topic.valid?
        expect(topic.errors).to have_key(:title)
      end

      it "is invalid with a blank field" do
        topic = Topic.new(title: "")
        topic.valid?
        expect(topic).to be_invalid
      end
    end

    describe "description" do
      it "is valid (5-50 characters)" do
        topic = Topic.new(description: Faker::Lorem.characters(14))
        topic.valid?
      end

      it "is invalid with a blank field" do
        topic = Topic.new(description: "")
        topic.valid?
        expect(topic.errors).to have_key(:description)
      end

      it "is invalid with 3 characters" do
        topic = Topic.new(description: "Hoi")
        topic.valid?
        expect(topic.errors).to have_key(:description)
      end

      it "is invalid over 50 characters" do
        topic = Topic.new(description: Faker::Lorem.characters(51))
        topic.valid?
        expect(topic.errors).to have_key(:description)
      end
    end

    describe "linking to user" do
      it "is linked" do
        user = User.new()
        topic = Topic.new(user: user)
        topic.valid?
      end

      it "is not linked" do
        topic = Topic.new()
        topic.valid?
        expect(topic.errors).to have_key(:user)
      end
    end

    describe "check if all validations work" do
      it "is correct" do
        topic = Topic.new(title: "Topic", description: "Testing the description", user: user)
        topic.valid?
        expect(topic.errors).to be_empty
      end
    end
  end
end
