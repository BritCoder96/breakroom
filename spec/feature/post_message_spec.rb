require 'rails_helper'
require 'capybara'

feature 'INTEGRATION TEST: Posting a message', js: true do
  let(:user) { create :user, email: "admin@test.com", password: "secret" }
  let!(:conversation) {create :conversation, user: user, title: "channel" }
  before { login_as user }

  # scenario 'posted in a conversation' do
  #   visit conversation_path(conversation)
  #   sleep(1)
  #   # Enter description in the text field
  #   # Expect the new task to be displayed in the list of tasks
  #   expect(page).to have_content(conversation.title)
  #
  #   fill_in 'message_body', with: "testing\n"
  #   sleep(1)
  #   expect(page).to have_content("testing")
  # end


  # RSPEC DOESNT RECOGNIZE ACTIONCABLE.
end
