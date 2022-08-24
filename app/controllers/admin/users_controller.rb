class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: %i[destroy]

  def index
    @users = User.all
  end

  def show
  end

  def destroy
    @user.destroy!
    redirect_to admin_users_path, success: t('.success')
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end
end
