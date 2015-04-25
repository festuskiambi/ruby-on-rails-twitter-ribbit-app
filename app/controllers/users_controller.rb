class UsersController < ApplicationController
def new
	 @user = User.new
end
def create
  @user = User.new(user_params)
 
  if @user.save
    redirect_to @user, notice: "Thank you for signing up for Ribbit!"
  else
    render 'new'
  end
  def user_params

  end 
end
def user_params
      params.require(:user).permit(:avatar_url,:name,:username, :email, :password, :password_confirmation)
    end

end
