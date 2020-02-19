require 'rails_helper'

feature 'Signin' do
    before(:all) do
        @user = create(:user)
    
    end

    scenario 'with  valid username and email' do
        sign_in(@user)

        expect(page).to have_content('Add Event')
    end

    scenario 'with invalid email' do
        user1 = User.new(username: 'username', email: 'invalid email')
        sign_in user1
        
        expect(page).to have_content('Signup now')
    end

    scenario 'with blank username and password' do
        user1 = User.new(username: '', email: '')
        sign_in user1
        
        expect(page).to have_content('Signup now')
    end

    def sign_in(user)
        visit login_path
        fill_in 'Username', with: user.username
        fill_in 'Email', with: user.email
        click_button 'Login'
    end
end