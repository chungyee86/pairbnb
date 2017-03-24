class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  # def create
  #   @user = User.new
  #   if @user.save
  #     redirect_to @url
  #   else
  #     'new'
  #   end
  # end

  def update
    if @user.update(user_params)
      flash[:success] = "Successfully user update"
      redirect_to @user
    else
      flash[:danger] = "Error updating user"
      render "edit"
    end
  end

  def delete
    @user.destroy
    redirect_to 'root'
  end

  private

  def find_user
    @user = User.all(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end
end
