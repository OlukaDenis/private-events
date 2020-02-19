require 'rails_helper'

feature 'Events' do
    before(:all) do
        @user = create(:user)  
        # @event = @user.create(:event)  
        @user1 = User.create(id: 5, username: 'tester', email: 'test@example.com')
    end

    before(:each) do
        @event = @user1.creator_events.build(title: 'Foobar', date: Time.now, description: 'Foobar is the just a dummy')
    end

    scenario 'creation' do
        sign_in @user
        click_link('Create Event')
        create_event
        expect(page).to have_content(@event.date)
    end
    
    def sign_in(user)
        visit login_path
        fill_in 'Username', with: user.username
        fill_in 'Email', with: user.email
        click_button 'Login'
    end

    def create_event
        fill_in 'Title', with: @event.title
        fill_in 'Description', with: @event.description
        fill_in 'Date', with: @event.date
        click_button 'Add Event'
    end
end