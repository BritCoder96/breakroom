require 'rails_helper'
require 'capybara'

feature 'INTEGRATION TEST: Create a conversation', js: true do
  let(:user) { create :user, email: "admin@test.com", password: "secret", admin: true }

  before { login_as user }

  scenario 'by filling in the form' do

    visit new_conversation_path

    fill_in 'conversation_title', with: "thema1"
    fill_in 'conversation_description', with: "Description"
    find(:xpath, 'input[type="checkbox"]').first.click
    # Press enter (to submit the form)
    page.execute_script("$('form').submit()")

    expect(page).to have_content('thema1')
  end
end

feature 'INTEGRATION TEST: Cant create a conversation as normal user', js: true do
  let(:user) { create :user, email: "admin@test.com", password: "secret", admin: false }

  before { login_as user }

  scenario 'by filling in the form' do
    visit new_conversation_path

    expect(page).not_to have_content('conversation_title')
  end
end
