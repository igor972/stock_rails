class ReportsController < ApplicationController
  def index
  end

  def sales
  end

  def products
    @products = Product.all
  end

  def warehouse_changes
  end
end
