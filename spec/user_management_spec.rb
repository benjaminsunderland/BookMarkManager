require 'web_helper'

feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, ben@sunderland.eu.com')
    expect(User.first.email).to eq('ben@sunderland.eu.com')
  end

scenario 'requires a matching confirmation password' do
  expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
end

  scenario 'requires a matching confirmation password' do
    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content 'Password and confirmation password do not match'
    end
end
