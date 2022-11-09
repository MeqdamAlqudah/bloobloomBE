require_relative '../rails_helper'

RSpec.describe Lense, type: :model do
  let(:lense) { create(:lense) }
  describe 'Attributes' do
    it { should validate_presence_of(:colour) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:stock) }
    it { should validate_presence_of(:lens_type) }
    it { should validate_presence_of(:prescription_type) }

    it 'colour must be string' do
      expect(lense.colour).to be_kind_of(String)
    end
    it 'price must be an integer' do
      expect(lense.price).to be_kind_of(Float)
    end
  end
end
