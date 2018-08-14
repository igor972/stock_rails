class WelcomeController < ApplicationController
  def index
    @customer_name = params[:name]
  end
end
