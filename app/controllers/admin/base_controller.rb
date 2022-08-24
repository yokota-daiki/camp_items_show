class Admin::BaseController < ApplicationController
  before_action :check_admin

  def check_admin
    redirect_to root_path, warning: t('権限がありません') unless current_user.admin?
  end
end