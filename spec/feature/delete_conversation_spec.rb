require 'rails_helper'
require 'capybara'

feature 'INTEGRATION TEST: Delete a conversation', js: true do
  let(:user) { create :user, email: "admin@test.com", password: "secret", admin: true }
  let(:conversation) { create :conversation, title: "channel", user: user}
  before { login_as user }

  scenario 'Going to the conversation' do
    # visit conversations_path
    # click_link(conversation.title)
    # sleep(2)
    # click_link('Delete channel')
    # expect(page).not_to have_content(conversation.title)

    # NOT WORKING YET. CANT FIND THE LINK DELETE CHANNEL.
  end
end
