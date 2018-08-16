class WarehouseChangesController < ApplicationController
  before_action :set_warehouse_change, only: [:show, :edit, :update, :destroy]

  # GET /warehouse_changes
  # GET /warehouse_changes.json
  def index
    @warehouse_changes = WarehouseChange.all
  end

  # GET /warehouse_changes/1
  # GET /warehouse_changes/1.json
  def show
  end

  # GET /warehouse_changes/new
  def new
    @warehouse_change = WarehouseChange.new
  end

  # GET /warehouse_changes/1/edit
  def edit
  end

  # POST /warehouse_changes
  # POST /warehouse_changes.json
  def create
    p warehouse_change_params
    @warehouse_change = WarehouseChange.new(warehouse_change_params)

    respond_to do |format|
      if @warehouse_change.save
        format.html { redirect_to @warehouse_change, notice: 'Warehouse change was successfully created.' }
        format.json { render :show, status: :created, location: @warehouse_change }
      else
        format.html { render :new }
        format.json { render json: @warehouse_change.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /warehouse_changes/1
  # PATCH/PUT /warehouse_changes/1.json
  def update
    respond_to do |format|
      if @warehouse_change.update(warehouse_change_params)
        format.html { redirect_to @warehouse_change, notice: 'Warehouse change was successfully updated.' }
        format.json { render :show, status: :ok, location: @warehouse_change }
      else
        format.html { render :edit }
        format.json { render json: @warehouse_change.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /warehouse_changes/1
  # DELETE /warehouse_changes/1.json
  def destroy
    @warehouse_change.destroy
    respond_to do |format|
      format.html { redirect_to warehouse_changes_url, notice: 'Warehouse change was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warehouse_change
      @warehouse_change = WarehouseChange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def warehouse_change_params
      params.require(:warehouse_change).permit(:product_id, :reason_id, :quantity)
    end
end
