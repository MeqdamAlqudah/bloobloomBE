require 'rails_helper'

RSpec.describe 'Lenses', type: :request do
  let(:lense) { create(:lense) }

  describe 'GET /index' do
    before(:example) { get('/api/admin/lenses') }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /index' do
    before(:example) { get('/api/store/lenses') }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    before(:example) { delete("/api/admin/lenses/#{lense.id}") }
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end
  end
end
