require_relative '../rails_helper'

RSpec.describe Frame, type: :model do
  let(:frame) { create(:frame) }
  describe 'Attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:stock) }
    it 'name must be string' do
      expect(frame.name).to be_kind_of(String)
    end
    it 'price must be an integer' do
      expect(frame.price).to be_kind_of(Float)
    end
  end
end
