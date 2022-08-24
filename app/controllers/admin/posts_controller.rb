class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: %i[destroy]

  def index
    @posts = Post.includes(:user).with_attached_images.all
  end

  def show
  end

  def destroy
    @post.destroy!
    redirect_to admin_posts_path, success: t('.success')
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
