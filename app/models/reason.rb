class Reason < ApplicationRecord
  validates :name, presence: true
  validates :action, presence: true
  validates :action, inclusion: {in: ['add', 'remove'], message: "%{value} must be add or remove"}

  def get_math_symbol
    action.eql?('add') ? '+' : '-'
  end

end
