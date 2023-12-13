class MissionsController < ApplicationController
  def index
    @missions = Mission.all
    render json: @missions.to_json
  end
end
