class ListingsController < ApplicationController

  before_action :find_user, except: [:index, :search]
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
    # byebug
    # authorization code
    if @user.Customer?
      flash[:notice] = "Sorry. You are not allowed to perform this action."
      return redirect_to user_listings_path(current_user), notice: "Sorry. You do not have the permission to verify a property."
    end
    # end authorization code

    # other code to make the new action work!

    # allowed?(action: <replace with your action>, user: current_user)

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
    # @listing = Listing.find(params[:id])
    @reservation = @listing.reservations.new
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

  def search
    # byebug
    @listings = Listing.search(params[:term], fields: ["name", "location"], misspellings: {below: 5})
    if @listings.blank?
      redirect_to listings_path, flash:{danger: "no successful search result"}
    else
      @counter ||= 0 unless @counter
      render :index
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:name, :location, :state, :country, :price ,:description, :room_type, :no_of_guest, photos:[])
  end

  # byebug
  def find_user
    @user = User.find(params[:user_id])
  end

  def find_listing
    @listing = Listing.find(params[:id])
  end

end
