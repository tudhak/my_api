class ListingsController < ApplicationController
  before_action :set_listing, only: [:show]

  def index
    @listings = Listing.all
    render json: @listings.to_json
  end

  def show
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
