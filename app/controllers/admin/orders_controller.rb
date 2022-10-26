class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @total = @order.total_payment - @order.shopping_cost
  end
end
