class Public::ReviewsController < ApplicationController

  def create
    @item = Item.find(params[:item_id])
    @review = current_customer.reviews.new(review_params)
    #@review  = Review.new(review_params)
    @review.customer_id = current_customer.id
    @review.item_id = @item.id
    if @review.save
      redirect_to item_path(@item)
    else

      render "public/items/show"

    end
  end

  def destroy
    @review = Review.find_by(id: params[:id]).destroy
    redirect_to items_path
  end


  private

  def review_params
    params.permit(:comment,:rate)
  end

end
