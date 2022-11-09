class Api::Admin::LensesController < ApplicationController
  def index
    lenses = Lense.all
    render json: lenses
  end

  def show
    Lense.find(params[:id])
  end

  def create
    lense = Lense.new(lense_params)
    if lense.save
      render json: lense
    else
      render json: { 'errors' => lense.errors.full_messages }
    end
  end

  def update
    lense = lense.find_by(lense_params)
    if lense.update(lense_params)
      render json: lense
    else
      render json: lense.errors.full_messages
    end
  end

  def destroy
    lense = Lense.find(params[:id])
    lense.destroy
    render json: 'Item was deleted successfully'
  end

  private

  def lense_params
    params.permit(:colour, :description,
                  :prescription_type, :lens_type, :stock, :price)
  end
end
