class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :destroy, :update]

  def index
    @listings = Listing.all
    render json: @listings.to_json

    #@listings = Listing.pluck(:id, :num_rooms)
    #                    .map( |id, num_rooms| {id: id, num_rooms: num_rooms} )
  end

  def show
    if stale?(last_modified: @listing.updated_at)
      render json: @listing.to_json
    end
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to listing_path(@listing)
      #render nothing: true, status: :no_content
    #else
      #render json: @listing.errors, status: :unprocessable_entity
    end
  end

  def update
    if @listing.update(listing_params)
      redirect_to listing_path(@listing)
      #render nothing: true, status: :no_content
    #else
      #render json: @listing.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @listing.destroy
    redirect_to listings_path, status: :see_other
    #render nothing :true, status: :no_content
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:num_rooms)
  end
end
