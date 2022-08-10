class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update]

  def index
    @posts = current_user.posts.with_attached_images
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:camp_field, :comment, :public, :camped_date, images: [])
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end

end
