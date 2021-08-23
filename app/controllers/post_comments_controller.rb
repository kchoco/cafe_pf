class PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_image = PostImage.find(params[:post_image_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    @post_comment.post_image_id = @post_image.id
    @post_comment.user_id = current_user.id
    unless @post_comment.save
      render 'error'
    end
  end

  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    post_comment = @post_image.post_comments.find(params[:id])
    post_comment.destroy

    #PostComment.find_by(id: params[:id], post_image_id: params[:post_image_id]).destroy
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
