class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  before_action :remove_invalid_sales, only: [:start_new_sale, :index]

  def index
    @sales = Sale.all
  end

  def show
  end

  def new
    @sale = Sale.new
    redirect_to sales_path(@sale)
  end

  def edit
  end

  def create
    @sale = Sale.new(sale_params)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to @sale, notice: 'Sale was successfully created.' }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # temos dois submit buttons no mesmo form, eh necessario verificar qual foi clicado
    unless params[:add_sale_product]
      redirect_to sales_path
    else
      respond_to do |format|
        if @sale.update(sale_params)
            format.html { redirect_to edit_sale_path(@sale), notice: 'Sale was successfully updated.' }
        else
          format.html { render :edit }
          format.json { render json: @sale.errors, status: :unprocessable_entity }
        end
      end
    end

  end

  def destroy
    @sale.destroy
    respond_to do |format|
      format.html { redirect_to sales_url, notice: 'Sale was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def start_new_sale
    @sale = Sale.create(total: 0.0)
    redirect_to edit_sale_path(@sale)
  end

  private
    def set_sale
      @sale = Sale.find(params[:id])
    end

    def sale_params
      params.require(:sale).permit(:total, sale_products_attributes: [:product_id, :quantity])
    end

    def remove_invalid_sales
      Sale.remove_invalid_sales
    end
end
