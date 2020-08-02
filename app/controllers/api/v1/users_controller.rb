class Api::V1::UsersController < ApplicationController
  def show
    user = ApiService.new.user(params[:id].to_i)
    render json: UserMapper.new.user_hash(user)
  end
end
