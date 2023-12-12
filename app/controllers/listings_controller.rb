class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :destroy]

  def index
    @listings = Listing.all
    render json: @listings.to_json
  end

  def show
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @listing.update(listing_params)
      redirect_to listing_path(@listing)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @listing.destroy
    redirect_to listing_path(@listing), status: :see_other
  end


  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:num_rooms)
  end
end
