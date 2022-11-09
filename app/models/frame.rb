class Frame < ApplicationRecord
  has_many :glasses
  validates :name, presence: true
  validates :description, presence: true
  validates :stock, presence: true
  validates :status, inclusion: {
    in: %w[Active inactive],
    message: '%<value>s is not valid as a status please choose Active or inactive'
  }
  validates :price_currency, inclusion: { in: %w[GBP USD EUR JOD JPY],
                                          message: '%<value>s is not a valid currency' }
  validates :price, presence: true, uniqueness: { scope: :price_currency,
                                                  message: 'Price %<value>s should be unique per currency' },
                    numericality: { greater_than: 0 }
end
