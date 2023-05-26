class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /orders or /orders.json
  def index
    @orders = Order.all
    @memberships = Membership.where(phone: @orders.pluck(:phone))
    @total_quantity = @orders.sum(:quantity)
    @total_price = @orders.sum { |order| order.product.price * order.quantity }
  end

  # GET /orders/1 or /orders/1.json
  def show
    @order = Order.find(params[:id])
  end

  # GET /orders/new
  def new
    @order = Order.new
    if params[:order] && params[:order][:phone]
      @membership = Membership.find_by(phone: params[:order][:phone])
      if @membership
        @order.name = @membership.name
        @order.voucher = @membership.voucher
      end 
    end
  end

  # GET /orders/1/edit
  def edit
  end

  def printbill
    @order = Order.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "bill",
               template: "orders/printbill.html.erb",
               layout: "pdf.html",
               orientation: "Portrait",
               lowquality: true,
               zoom: 1,
               dpi: 75
      end
    end
  end

  helper_method :total_quantity


  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to order_url(@order), notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_url(@order), notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def order_params
    params.require(:order).permit(:name, :phone, :address, :delivery_date, :product_id, :payment_option, :quantity, :order_status, :cardholder_name, :card_number, :bank_name, :price)
  end
end
