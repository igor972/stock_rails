module ApplicationHelper

  def products_list
    Product.all
  end

  def reasons_list
    Reason.all
  end
end
