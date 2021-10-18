class Public::OrdersController < ApplicationController
  def new
   @order = Order.new
  end

  def verification
    @order = Order.new
    @cart_items = current_customer.cart_items
    #支払方法
    @order.payment_method = params[:order][:payment_method].to_i
    #お届け先
    case params[:delivery]
    #ご自身の住所
    when "0"

      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    when "1"
    when "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  def completion
  end

  def create
  end

  def index
  end

  def show
  end




end