# frozen_string_literal: true

def login_user(user)
  visit new_user_session_path
  fill_in 'user_email', with: user.email
  fill_in 'user_password', with: user.password
  click_on 'commit'
end
