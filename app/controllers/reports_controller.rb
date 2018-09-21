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
    parameters = warehouse_changes_params

    if parameters[:start] && parameters[:finish]
      if date_is_valid?(parameters[:start]) && date_is_valid?(parameters[:finish])
        @warehouse_change_result = WarehouseChange.warehouse_changes_by_date_and_product(parameters[:start].to_date, 
                                                                                        parameters[:finish].to_date,
                                                                                        parameters[:product_id])
        if @warehouse_change_result.count <= 0
          flash.alert = 'Nenhum item retornado na data informada.'
        end
      else
        flash.alert = 'Data inválida. Verifique e tente novamente.'
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def warehouse_changes_params
      return params.permit(:start, :finish, :product_id)
    end
end
