class Reason < ApplicationRecord
  validates :name, presence: true
  validates :action, presence: true
  validates :action, inclusion: {in: ['add', 'remove'], message: "%{value} must be add or remove"}
  before_destroy :cant_remove_if_there_is_warehouse_change_associated

  def get_math_symbol
    action.eql?('add') ? '+' : '-'
  end

  def cant_remove_if_there_is_warehouse_change_associated
    if WarehouseChange.there_is_reason_associated?(id)
      errors.add(:base, "Não é possível remover este 'Motivo', pois está associado a mudanças de estoque.")
      throw(:abort)
    end
  end

end
