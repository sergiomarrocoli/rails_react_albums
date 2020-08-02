class Api::V1::AlbumsController < ApplicationController
  def index
    render json: AlbumsService.new.albums_hash_array
  end

  def show
    render json: ApiService.new.photos(params[:id])
  end
end
