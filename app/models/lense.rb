class Lense < ApplicationRecord
  has_many :glasses
  validates :colour, presence: true
  validates :description, presence: true
  validates :prescription_type, presence: true, inclusion: { in: %w[fashion single_vision varifocal],
                                                             message: '%<value>s is not a valid prescription type ,
                                                              should be (fashion,single_vision,varifocal)' }
  validates :lens_type, presence: true, inclusion: { in: %w[classic blue_light transition],
                                                     message: '%<value>s is not a valid lens type should be
                                                      (classic,blue_light,transition)' }
  validates :stock, presence: true, numericality: { only_integer: true }
  validates :price_currency, inclusion: { in: %w[GBP USD EUR JOD JPY],
                                          message: '%<value>s is not a valid currency' }
  validates :price, presence: true, uniqueness: { scope: :price_currency,
                                                  message: 'Price %<value>s should be unique per currency' }
end
