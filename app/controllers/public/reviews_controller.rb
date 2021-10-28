class Public::ReviewsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @review = current_customer.reviews.new(item_id: @item.id)
    #@review  = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.item_id = @item.id
    if @review.save
      redirect_to item_path(@item)

    else
      redirect_to items_path
    end
  end

  private
  def review
    params.require(:review).permit(:comment,:customer_id,:item_id)
  end

end
