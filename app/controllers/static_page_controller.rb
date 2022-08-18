class StaticPageController < ApplicationController
  skip_before_action :require_login, only: %i[top]
  def top
    all_posts = Post.where(public: true).with_attached_images
    @posts = all_posts.sample(6)
  end
end
