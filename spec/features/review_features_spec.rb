require 'rails_helper'
require 'web_helper'

feature 'Reviews' do
  scenario 'displays an average rating for all users' do
    leave_review('So so', '3')
    click_link('Sign out')
    leave_review2('Great', '5')
    expect(page).to have_content('Average rating: 4')
  end
end
