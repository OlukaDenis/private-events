require 'rails_helper'

feature 'Signup' do

    scenario 'with valid username and email' do
        sign_up_with 'mcdenny', 'olukadeno@gmail.com'

        expect(page).to have_content('Logout')
    end

    scenario 'with invalid email' do
        sign_up_with 'mcdenny', 'invalid email'
        
        expect(page).to have_content('Login now')
    end

    scenario 'with blank username and password' do
        sign_up_with '', ''
        
        expect(page).to have_content('Login now')
    end

    def sign_up_with(username, email)
        visit signup_path
        fill_in 'Username', with: username
        fill_in 'Email', with: email
        click_button 'Signup'
    end
end