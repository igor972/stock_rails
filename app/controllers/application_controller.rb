class ApplicationController < ActionController::Base
  def date_is_valid?(date)
    begin 
      date.to_date
    rescue
      return false
    end
    return true
  end
end
