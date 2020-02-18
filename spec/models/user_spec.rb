# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(username: 'testuser', email: 'test@test.com')
  end

  it 'has valid attributes' do
    expect(@user).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:email) }

    # Allow valid emails
    it do
      should_not allow_values('foo@gmail,com', 'foobar.com').for(:email)
    end

    # Not to allow nil values
    it do
      expect(@user).not_to allow_value(nil).for(:username)
      expect(@user).not_to allow_value(nil).for(:email)
    end
  end

  describe 'associations' do
    it { should have_many(:attendances).dependent(:destroy) }
    it { should have_many(:attended_events) }
  end
end
