class Public::ReviewsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @review = current_customer.reviews.new(review_params)
    #@review  = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.item_id = @item.id
    @review.save
    redirect_to item_path(@item)
  end

  private

  def review_params
    params.permit(:comment,:customer_id,:item_id,:rate)
  end

end
