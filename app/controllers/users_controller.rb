class UsersController < ApplicationController
   before_filter :authorize

  def new
  end

  def create

    user = User.new(user_params)
    if user.save
      User.first.destroy
      session[:user_id] = user.id
      redirect_to '/admin/masterviewer'
    else
      redirect_to '/'
    end
  end

private
  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
