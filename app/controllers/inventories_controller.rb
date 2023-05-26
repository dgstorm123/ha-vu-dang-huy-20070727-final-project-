class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[show edit update destroy]
  before_action :authenticate_user!
  
  # GET /inventories or /inventories.json
  
  def index
    @inventories = Inventory.all
    @inventories_warning = Inventory.where("day_left < ?", 4)
    @total_inventories_warning = @inventories_warning.sum(:quantity)
    @inventory_names_warning = @inventories_warning.pluck(:name)
    @inventories.each do |inventory|
      exp_day = inventory.exp_day.to_date
      import_day = inventory.import_day.to_date
      day_left = (exp_day - import_day).to_i
  
      inventory.update(day_left: day_left)
      end
  end
  


  # GET /inventories/1 or /inventories/1.json
  def show
    # No need to iterate over @inventories here
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  # GET /inventories/1/edit
  def edit
  end

  # POST /inventories or /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to inventory_url(@inventory), notice: "Inventory was successfully created." }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1 or /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to inventory_url(@inventory), notice: "Inventory was successfully updated." }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1 or /inventories/1.json
  def destroy
    @inventory.destroy

    respond_to do |format|
      format.html { redirect_to inventories_url, notice: "Inventory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_inventory
    @inventory = Inventory.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def inventory_params
    params.require(:inventory).permit(:name, :quantity, :import_day, :exp_day, :provider, :day_left)
  end
end
