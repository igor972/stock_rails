module SalesHelper
  def get_all_active_sales
    Sale.actives_sales
  end

  def sale_status(sale)
    ret = ""
    if sale.active
      ret = "<span class='badge badge-info'>Ativo</span>"
    else
      ret = "<span class='badge badge-danger'>Cancelado</span>"
    end
    ret.html_safe
  end
end
