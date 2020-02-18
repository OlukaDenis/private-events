# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Logouts', type: :request do
  describe 'DELETE /logout' do
    it 'works! (now write some real specs)' do
      delete logout_path
      expect(response).to have_http_status(302)
    end
  end
end
