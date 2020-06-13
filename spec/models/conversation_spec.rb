require 'rails_helper'

RSpec.describe Conversation, type: :model do
  describe "creating a conversation" do
    let(:user) { create :user }
    let(:conversation) { create :conversation, user: user }

    describe "making a title" do
      it "is valid between 3 and 20 characters" do
        conversation = Conversation.new(title: "Hoi!")
        conversation.valid?
      end

      it "is invalid over 20 characters" do
        conversation = Conversation.new(title: "Hoi! This is just a test to see if it exceeds the 20 characters.")
        conversation.valid?
        expect(conversation.errors).to have_key(:title)
      end

      it "is invalid below 2 characters" do
        conversation = Conversation.new(title: "H")
        conversation.valid?
        expect(conversation.errors).to have_key(:title)
      end

      it "is invalid with a blank field" do
        conversation = Conversation.new(title: "")
        conversation.valid?
        expect(conversation).to be_invalid
      end
    end

    describe "description" do
      it "is valid (5-50 characters)" do
        conversation = Conversation.new(description: Faker::Lorem.characters(14))
        conversation.valid?
      end

      it "is invalid with a blank field" do
        conversation = Conversation.new(description: "")
        conversation.valid?
        expect(conversation.errors).to have_key(:description)
      end

      it "is invalid with 3 characters" do
        conversation = Conversation.new(description: "Hoi")
        conversation.valid?
        expect(conversation.errors).to have_key(:description)
      end

      it "is invalid over 50 characters" do
        conversation = Conversation.new(description: Faker::Lorem.characters(51))
        conversation.valid?
        expect(conversation.errors).to have_key(:description)
      end
    end

    describe "linking to user" do
      it "is linked" do
        user = User.new()
        conversation = Conversation.new(user: user)
        conversation.valid?
      end

      it "is not linked" do
        conversation = Conversation.new()
        conversation.valid?
        expect(conversation.errors).to have_key(:user)
      end
    end

    describe "check if all validations work" do
      it "is correct" do
        conversation = Conversation.new(title: "Conversation", description: "Testing the description", user: user)
        conversation.valid?
        expect(conversation.errors).to be_empty
      end
    end
  end
end
