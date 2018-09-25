class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def is_number?(value)
    return Integer(value) rescue false
  end
end
