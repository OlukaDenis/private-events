require 'rails_helper'

feature 'Index Page' do
    
    scenario 'without login' do
        visit root_url
        expect(page).to have_content('Sign In Now To Get Started')
    end

    scenario 'with a logged in user' do
        user = create(:user)
        visit login_path
        fill_in 'Username', with: user.username
        fill_in 'Email', with: user.email
        click_button 'Login'
        visit root_url

        expect(page).to have_content('Add Event')
    end
    
end