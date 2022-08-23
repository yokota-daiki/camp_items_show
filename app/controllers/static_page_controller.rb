class StaticPageController < ApplicationController
  skip_before_action :require_login, only: %i[top reload]
  def top
    @posts = Post.where(public: true).with_attached_images.sample(6)
  end

  def reload
    @posts = Post.where(public: true).with_attached_images.sample(6)
  end

  def terms_of_service;end

  def privacy_policy;end
end
