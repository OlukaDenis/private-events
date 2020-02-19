# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController do
  it { should route(:get, login_path).to(action: :new) }
  it { should route(:post, login_path).to(action: :create) }
  it { should route(:delete, logout_path).to(action: :destroy) }

  describe 'GET #new' do
    it { expect(response).to have_http_status(:success) }
  end
end
