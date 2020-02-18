# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  before(:all) do
    @user = User.create(id: 1, username: 'tester', email: 'test@example.com')
  end

  before(:each) do
    @event = @user.creator_events.build(title: 'Foobar', date: Time.now, description: 'Foobar is the just a dummy')
  end

  it 'has valid attributes' do
    expect(@event).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:creator_id) }

    # Not to allow nil values
    it do
      # expect(@user).not_to allow_value(nil).for(:username)
      # expect(@user).not_to allow_value(nil).for(:email)
    end
  end

  describe 'associations' do
    it { should belong_to(:creator) }
    it { should have_many(:attendances).dependent(:destroy) }
    it { should have_many(:attendees) }
  end
end
