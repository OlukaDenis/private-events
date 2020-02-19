# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  it { should route(:get, root_path).to(action: :index) }
  it { should route(:get, event_path(1)).to(action: :show, id: 1) }

  describe 'GET #new' do
    it { expect(response).to have_http_status(:success) }
  end

  describe 'GET #index' do
    it { expect(response).to have_http_status(:success) }
  end
end
