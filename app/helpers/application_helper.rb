module ApplicationHelper

  def products_list
    Product.all
  end

  def products_list_with_name_with_price
    products_list = []
    Product.all.each do |product|
      product.name = "#{product.name} - R$ #{product.price}"
      products_list.push(product)
    end
    products_list
  end

  def reasons_list
    Reason.all
  end

  def format_money(money)
    number_to_currency(money, :unit => "R$ ", :separator => ",", :delimiter => ".")
  end
end
