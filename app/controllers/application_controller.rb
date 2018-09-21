class ApplicationController < ActionController::Base
  def date_is_valid?(date)
    begin 
      raise 'invalid' if date.to_date == nil
    rescue
      return false
    end
    return true
  end
end
