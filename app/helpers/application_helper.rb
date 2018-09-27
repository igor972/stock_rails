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

  def flash_class(level)
    case level
        when 'notice' then "alert alert-info"
        when 'success' then "alert alert-success"
        when 'error' then "alert alert-danger"
        when 'alert' then "alert alert-warning"
    end
  end

  def get_product_image(product)
    if product.image == ''
      return image_tag 'missing.jpg', width: 100, height: 50
    else
      return image_tag product.image, width: 100, height: 50
    end
  end
end
