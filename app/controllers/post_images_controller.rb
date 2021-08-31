class PostImagesController < ApplicationController

  def new
    @post_image = PostImage.new
    @post_image.tag_list.add('awesome', "slick")      #タグを追加
    @post_image.tag_list.remove('awesome', "slick")   #タグを削除
    gon.lat = ""    #地図機能
    gon.lng = ""    #地図機能
    @post_image.build_spot
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
    @all_ranks = PostImage.find(Favorite.group(:post_image_id).order('count(post_image_id) desc').limit(3).pluck(:post_image_id))
    if params[:tag]
      @post_images = PostImage.tagged_with(params[:tag])
    else
      @post_images = PostImage.all.order(created_at: :desc)
    end
    @tags = Tag.limit(5).distinct.order(created_at: :desc)
  end

  def show
    @post_image = PostImage.find(params[:id])
    @lat = @post_image.spot.latitude
    @lng = @post_image.spot.longitude
    gon.lat = @lat
    gon.lng = @lng
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
    @all_ranks = PostImage.find(Favorite.group(:post_image_id).order('count(post_image_id) desc').limit(3).pluck(:post_image_id))
    @keyword = params[:keyword]
    render 'index'
  end


private

  def post_image_params
    params.require(:post_image).permit(:title, :image, :introduction, :evaluation,:content, :tag_list, :rate, :latitude, :longitude, spot_attributes: [:address])
  end

end
