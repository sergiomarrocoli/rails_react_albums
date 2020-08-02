class Api::V1::LocationsController < ApplicationController
  def show
    user = ApiService.new.user(user_id)
    render json: LocationMapper.new.location_hash(user)
  end

  private

  def user_id
    params[:user_id].to_i
  end
end
