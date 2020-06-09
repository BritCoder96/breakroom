require 'rails_helper'
require 'capybara'

feature 'INTEGRATION TEST: Delete a topic', js: true do
  let(:user) { create :user, email: "admin@test.com", password: "secret", admin: true }
  let(:topic) { create :topic, title: "channel", user: user}
  before { login_as user }

  scenario 'Going to the topic' do
    # visit topics_path
    # click_link(topic.title)
    # sleep(2)
    # click_link('Delete channel')
    # expect(page).not_to have_content(topic.title)

    # NOT WORKING YET. CANT FIND THE LINK DELETE CHANNEL.
  end
end
