class UsersController < ApplicationController
  def show
    @show_user = User.find(params[:id])
    @show_user
  end

  def index
    @all_users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    if @user.save
      redirect_to @url
    else
      'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update

  end

  def delete
    @delete_user = User.find(params[:id])
    @delete_user.destroy
    redirect_to 'root'
  end
end
