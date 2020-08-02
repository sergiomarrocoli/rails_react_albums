class Api::V1::UsersController < ApplicationController
  def show
    user = ApiService.new.user(id)
    render json: UserMapper.new.user_hash(user)
  end

  private

  def id
    params[:id].to_i
  end
end
