class Shoplist < ApplicationRecord
  has_many :glasses
  belongs_to :user
end
