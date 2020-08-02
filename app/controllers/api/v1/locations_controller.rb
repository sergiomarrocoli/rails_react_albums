class Api::V1::LocationsController < ApplicationController
  def show
    user = ApiService.new.user(params[:user_id].to_i)
    render json: LocationMapper.new.location_hash(user)
  end
end
