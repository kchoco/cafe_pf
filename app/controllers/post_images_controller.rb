class PostImagesController < ApplicationController

  def new
    @post_image = PostImage.new
    @post_image.tag_list.add('awesome', "slick")      #タグを追加
    @post_image.tag_list.remove('awesome', "slick")   #タグを削除
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render "new"
    end
  end

  def index
    @post_images = PostImage.all.order(created_at: :desc)
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
    @post_comment.save
    render :show
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  def search
    @post_images = PostImage.search(params[:keyword])
    @keyword = params[:keyword]
    render 'index'
  end


private

  def post_image_params
    params.require(:post_image).permit(:title, :image, :introduction, :evaluation, :tag_list)
  end

end
