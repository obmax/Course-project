class Admin::UsersController < Admin::AdminController
  
  def index
    @users = User.all
  end
  
  def desroy 
    User.find(params[:id]).destroy
    redirect_to admin_users_url
  end

  def update
    @user = User.find(params[:id])
    @user.update(blocked: !@user.blocked)
    redirect_to admin_users_url
  end

end