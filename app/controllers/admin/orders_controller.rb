class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    #@orders = @order.order_details.all
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == '入金確認'
       @order.order_details.update_all(making_status: 1)
    end
    redirect_to admin_order_path(@order)
  end

  private
   def order_params
     params.require(:order).permit(:customer_id,:postal_code,:payment_method,:address,:name,:shopping_cost,:total_payment,:status)
   end

end
