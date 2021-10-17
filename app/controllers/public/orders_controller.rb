class Public::OrdersController < ApplicationController
  def new
   @order = Order.new
  end

  def verification
    @cart_items = current_customer.cart_items
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