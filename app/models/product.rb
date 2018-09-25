class Product < ApplicationRecord
  validates :name, presence: true, allow_blank: false
  validates :description, presence: true, allow_blank: false
  validates :price, presence: true, allow_blank: false
  validate :cant_be_negative

  def cant_be_negative
    unless is_number?(self.price)
      errors.add(:price, "Deve ser número válido") 
      return ''
    end

    if self.price < 1
      errors.add(:price, "Deve ser maior que 0")
      return ''
    end
  end
end
