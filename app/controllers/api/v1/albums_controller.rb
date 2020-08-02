class Api::V1::AlbumsController < ApplicationController
  def index
    render json: AlbumsService.new.albums_hash_array
  end
end
