class ListingsController < ApplicationController

  before_action :find_user, except: [:index]
  before_action :find_listing, only: [:show, :edit, :update, :destroy]

  def index
    # @listings = Listing.all
    @counter ||= 0 unless @counter
    if params[:value]
      @counter += params[:value].to_i
      @listings = Listing.all.limit(10).offset(@counter)
    else
      @listings = Listing.all.limit(10).offset(0)
    end
  end
  # byebug
  def new
    @listing = @user.listings.new
  end

  def create
    # byebug
    @listing = @user.listings.new(listing_params)
    if @listing.save
      redirect_to user_listing_path(@user, @listing)
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
      redirect_to user_listing_path(@user,@listing)
    else
      flash[:danger] = "Error updating listing"
      render :edit
    end
  end

  def destroy
    @listing.destroy
    redirect_to user_listings_path(@user)
  end

  private

  def listing_params
    params.require(:listing).permit(:location, :state, :country, :price ,:description, :room_type, :no_of_guest)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_listing
    @listing = Listing.find(params[:id])
  end

end
