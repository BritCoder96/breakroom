require 'rails_helper'
require 'capybara'

feature 'INTEGRATION TEST: Posting a message', js: true do
  let(:user) { create :user, email: "admin@test.com", password: "secret" }
  let!(:topic) {create :topic, user: user, title: "channel" }
  before { login_as user }

  # scenario 'posted in a topic' do
  #   visit topic_path(topic)
  #   sleep(1)
  #   # Enter description in the text field
  #   # Expect the new task to be displayed in the list of tasks
  #   expect(page).to have_content(topic.title)
  #
  #   fill_in 'message_body', with: "testing\n"
  #   sleep(1)
  #   expect(page).to have_content("testing")
  # end


  # RSPEC DOESNT RECOGNIZE ACTIONCABLE.
end
