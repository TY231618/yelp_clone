def sign_up
  click_link("Sign up")
   fill_in("Email", with: "test@test.com")
   fill_in("Password", with: "testtest")
   fill_in("Password confirmation", with: "testtest")
   click_button("Sign up")
end

def sign_up2
  click_link("Sign up")
   fill_in("Email", with: "newtest@test.com")
   fill_in("Password", with: "test1234")
   fill_in("Password confirmation", with: "test1234")
   click_button("Sign up")
end

def create_restaurant
  click_link 'Add Restaurant'
  fill_in 'Name', with: 'KFC'
  click_button 'Create Restaurant'
end

def leave_review(thoughts, rating)
  visit '/restaurants'
  sign_up
  create_restaurant
  click_link 'Review KFC'
  fill_in 'Thoughts', with: thoughts
  select rating, from: 'Rating'
  click_button 'Leave Review'

end

def leave_review2(thoughts, rating)
  visit '/restaurants'
  sign_up2
  click_link 'Review KFC'
  fill_in 'Thoughts', with: thoughts
  select rating, from: 'Rating'
  click_button 'Leave Review'
end
# def already_signed_in
#   visit '/restaurants'
# end
