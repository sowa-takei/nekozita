class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @post_comment = PostComment.new
    @post_comments = @item.post_comments.all
    @reviews = @item.reviews.all
    @review = Review.new
  end
end
