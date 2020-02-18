# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController do
  it { should route(:get, user_path(1)).to(action: :show, id: 1) }
  it { should route(:post, signup_path).to(action: :create) }

  describe 'GET #new' do
    it { expect(response).to have_http_status(:success) }
  end

  describe 'GET #create' do
    it { expect(response).to have_http_status(:success) }
  end

  # describe 'POST #create' do

  #     it do
  #         params = {
  #             user: {
  #                 username: "Username",
  #                 email: "me@me.com"
  #             }
  #         }

  #         should permit(:username, :email)
  #                 .for(:create, params: params)
  #                 .on(:user)
  #     end
  # end
end
