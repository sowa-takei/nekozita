class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_item
  end

  def update
  end

  def delete
  end

  def destroy
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    #if current_customer.cart_item.find_by(item_id: params[:cart_item][:item_id]).present?
    #cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    #cart_item.amount += params[:cart_item][:amount].to_i
    @cart_item.save
    redirect_to cart_items_path
    #elsif @cart_item.save
    #redirect_to cart_items_path
    #else
    #render 'customers/items/show'
    #end
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :customer_id, :amount)
  end
end
