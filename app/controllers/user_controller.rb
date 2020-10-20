class UserController < ApplicationController
  before_action :authenticate_user!


  def edit
    #@user = Post.find(params[:id])
    @user = current_user
  end

  def update
    @user = current_user

    if(@user.update(user_params))
      redirect_to @user
    else
      render 'edit'
    end
  end

  def show

  end

  private def user_params
    params.require(:user).permit(:first_name, :last_name)
  end
end
