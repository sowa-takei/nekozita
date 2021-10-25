class Public::PostCommentsController < ApplicationController
  def create
    @post_comment = current_customer.post_comments.new(post_comment_params)
    if @post_comment.save
      redirect_back(fallback_location: root_path)  #コメント送信後は、一つ前のページへリダイレクトさせる。
    else
      redirect_back(fallback_location: root_path)  #同上
    end
  end

  def destory
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
