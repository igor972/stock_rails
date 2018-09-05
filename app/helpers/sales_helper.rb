module SalesHelper
  def get_all_active_sales
    Sale.actives_sales
  end
end
