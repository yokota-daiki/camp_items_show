class PostsController < ApplicationController
  
  def index
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

  def edit
  end

  private

  def post_params
    params.require(:post).permit(:camp_field, :comment, :public, :camped_date)
  end
end
