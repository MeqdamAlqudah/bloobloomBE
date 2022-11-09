require_relative '../rails_helper'

RSpec.describe Glass, type: :model do
  let(:lense) { create(:lense) }
  let(:frame) { create(:frame) }
  let(:user) { create(:user) }
  let(:shoplist) { create(:shoplist, user_id: user.id) }
  let(:glass) do
    create(:glass, frame_id: frame.id, lense_id: lense.id, user_id: user.id, shoplist_id: shoplist.id,
                   price: frame.price + lense.price)
  end
  describe 'Attributes' do
    it { should validate_presence_of(:frame_id) }
    it { should validate_presence_of(:lense_id) }
    it { should validate_presence_of(:shoplist_id) }

    it 'glass frame must equal frame' do
      expect(glass.frame).to eql(frame)
    end
    it 'glass lense should equal to the created one' do
      expect(glass.lense).to eql(lense)
    end
    it 'glass shoplist should equal to the created one' do
      expect(glass).to be_in(shoplist.glasses)
    end
  end
end
