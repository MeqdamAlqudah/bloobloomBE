require 'rails_helper'

RSpec.describe 'Frames', type: :request do
  let(:frame) { create(:frame) }

  describe 'GET /index' do
    before(:example) { get('/api/admin/frames') }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /index' do
    before(:example) { get('/api/store/frames') }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    before(:example) { delete("/api/admin/frames/#{frame.id}") }
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end
  end
end
