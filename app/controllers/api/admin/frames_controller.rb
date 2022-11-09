class Api::Admin::FramesController < ApplicationController
  def index
    frames = Frame.all
    render json: frames
  end

  def show
    frame = Frame.find(params[:id])
    render json: frame
  end

  def create
    frame = Frame.new(frame_params)
    if frame.save
      render json: frame
    else
      render json: { 'errors' => frame.errors.full_messages }
    end
  end

  def update
    frame = Frame.find(params[:id])
    if frame.update(frame_params)
      render json: frame
    else
      render json: frame.errors.full_messages
    end
  end

  def destroy
    frame = Frame.find(params[:id])
    frame.destroy
    render json: 'item was destroied successfully'
  end

  private

  def frame_params
    params.permit(:name, :description, :status,
                  :price, :price_currency, :stock)
  end
end
