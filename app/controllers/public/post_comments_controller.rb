class Public::PostCommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @postcomment = PostComment.new(post_comment_params)
    @postcomment.customer_id = current_customer.id
    @postcomment.item_id = @item.id
    if @postcomment.save
      redirect_to item_path(@item)

    else
      redirect_to items_path
    end
  end

  def destroy
    PostComment.find_by(id: params[:id]).destroy
    redirect_to items_path
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment,:customer_id,:item_id)
  end
end
