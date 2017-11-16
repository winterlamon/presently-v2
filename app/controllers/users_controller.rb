class UsersController < ApplicationController
  def new
    @user = User.new
  end

def create
  @user = User.new(user_params)
  if @user.categories.length == 3
    if @user.save
      session[:id] = @user.id
      redirect_to user_path(@user)
    elsif @user.categories.length != 3
      flash[:notice] = "Please select 3 categories."
      render :new
    else
      flash[:notice] = "That is not a valid user."  # can i iterate through error messages and display each one as a flash notice?
      render :new
    end
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
