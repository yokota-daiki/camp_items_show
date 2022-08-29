class Admin::UsersController < Admin::BaseController
  before_action :set_user, only: %i[destroy edit update] 

  def index
    @users = User.order(created_at: :desc).page(params[:page])
  end

  def edit;end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  def destroy
    @user.destroy!
    redirect_to admin_users_path, success: t('.success')
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :role)
  end
end
