class Glass < ApplicationRecord
  belongs_to :shoplist
  belongs_to :frame
  belongs_to :lense
  belongs_to :user
  validates :frame_id, presence: true
  validates :lense_id, presence: true
  validates :shoplist_id, presence: true
  validates :price, presence: true
end
