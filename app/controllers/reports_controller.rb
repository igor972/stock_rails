class ReportsController < ApplicationController
  def index
  end

  def sales
    @today = Sale.filter_by_date(DateTime.now, DateTime.now)
  end

  def products
    @products = Product.all
  end

  def warehouse_changes
  end
end
