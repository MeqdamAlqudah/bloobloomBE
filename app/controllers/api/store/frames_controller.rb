class Api::Store::FramesController < ApplicationController
  def index
    frames = Frame.where(status: 'Active')
    render json: frames
  end
end
