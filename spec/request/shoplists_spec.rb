require 'rails_helper'

RSpec.describe 'Shoplists', type: :request do
  let(:lense) { create(:lense) }
  let(:frame) { create(:frame) }
  let(:user) { create(:user) }
  let(:shoplist) { create(:shoplist, user_id: user.id) }
  describe 'GET /show' do
    before(:example) { get("/api/store/shoplists/show/#{user.id}") }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create_glasse' do
    before(:example) do
      post('/api/store/shoplists/create_glasse', params:
        {
          frame_id: frame.id,
          lense_id: lense.id,
          user_id: user.id,
          shoplist_id: shoplist.id
        })
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
