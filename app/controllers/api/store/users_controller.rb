class Api::Store::UsersController < ApplicationController
  def index
    user = User.all
    render json: user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages
    end
  end

  private

  def user_params
    params.permit(:name, :user_currency)
  end
end
