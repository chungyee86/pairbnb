class ListingsController < ApplicationController

  before_action :find_user, except: [:index]
  before_action :find_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def new
    @listing = @user.listings.new
  end

  def create
    @listing = @user.listings.new(listing_params)
    if @listing.save
      redirect_to @listing
    else
      render "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      flash[:success] = "Successfully updated listing"
      redirect_to @listing
    else
      flash[:danger] = "Error updating listing"
      render :edit
    end
  end

  def destroy
    @listing.destroy
    redirect_to user_listings_url(@user)
  end

  private

  def listing_params
    params.require(:listing).permit(:location, :state, :country, :price ,:description, :room_type, :no_of_guest)
  end

  def find_user
    @user = User.find(params[:users_id])
  end

  def find_listing
    @listing = Listing.find(params[:id])
  end

end
