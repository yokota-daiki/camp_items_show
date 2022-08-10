class StaticPageController < ApplicationController
  skip_before_action :require_login, only: %i[top]
  def top
    @posts = Post.where(public: true)
  end
end
