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

  def format_datetime(date)
    date.strftime("%H:%M:%S %d/%m/%Y")
  end

  def action_name(action, name = nil)
    ret = ""
    if action == 'add'
      if name != nil 
        ret =  "<span class='badge badge-success'>#{name}</span>"
      else
        ret =  "<span class='badge badge-success'>Adicionará</span>"
      end
    elsif action == 'remove'
      if name != nil 
        ret = "<span class='badge badge-danger'>#{name}</span>"
      else
        ret =  "<span class='badge badge-danger'>Removerá</span>"
      end
      
    end
    
    return ret.html_safe
  end
end
