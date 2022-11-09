class User < ApplicationRecord
  has_many :glasses
  validates :name, presence: true, uniqueness: true
  validates :user_currency, inclusion: { in: %w[GBP USD EUR JOD JPY],
                                         message: '%<value>s is not a valid currency' }
end
