class Api::V1::AlbumsController < ApplicationController
  def index
    render json: AlbumsService.new.albums_hash_array(user_id)
  end

  def show
    render json: ApiService.new.photos(id)
  end

  private

  def user_id
    params[:user_id]
  end

  def id
    params[:id]
  end
end
