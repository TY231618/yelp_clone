require 'rails_helper'
require 'web_helper'

feature 'Reviews' do
  scenario 'displays an average rating for all reviews' do
    leave_review('so so', '3')
    click_link('Sign out')
    leave_review2('Great!', '5')
    expect(page).to have_content('Average rating: ★★★★☆')
  end
end
