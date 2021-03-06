class UsersController < ApplicationController

  def new
    @user = User.new
  end

def create
  @user = User.new(user_params)
  if @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  else
    flash[:notice] = "That is not a valid user."
    render :new
  end
end

def show
  @user = User.find(params[:id])
end

private

def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :bio, category_ids:[])
  end
end
