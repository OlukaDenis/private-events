# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  # before(:all) {
  #         @user = User.new(username: "testinguser", email: "test@testing.com")
  #         log_in @user
  #     }

  it { should route(:get, root_path).to(action: :index) }
  it { should route(:get, event_path(1)).to(action: :show, id: 1) }

  describe 'GET #new' do
    it { expect(response).to have_http_status(:success) }
  end

  describe 'GET #index' do
    it { expect(response).to have_http_status(:success) }
  end

  # describe 'POST #create' do

  #     it do
  #         params = {
  #             event: {
  #                 title: "Test",
  #                 date: DateTime.now,
  #                 creator_id: 1,
  #                 description: "This is ijus a test"
  #             }
  #         }

  #         should permit(:title, :date, :creator_id, :description)
  #                 .for(:create, params: params)
  #                 .on(:event)
  #     end
  # end
end
