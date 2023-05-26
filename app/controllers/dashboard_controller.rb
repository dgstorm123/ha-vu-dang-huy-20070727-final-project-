class DashboardController < ApplicationController
    before_action :authenticate_user!
    def index
      @total_quantity = Order.sum(:quantity)
      puts "Total Quantity: #{@total_quantity}"
  
      @orders = Order.all
      @total_price = @orders.sum { |order| order.product.price * order.quantity }
      puts "Total Price: #{@total_price}"
  
      @inventories = Inventory.all
      @inventory_names = @inventories.pluck(:name)
  
      @inventories_warning = Inventory.where("day_left < ?", 4)
      @total_inventories_warning = @inventories_warning.sum(:quantity)
      @inventory_names_warning = @inventories_warning.pluck(:name)
    end
  end
  