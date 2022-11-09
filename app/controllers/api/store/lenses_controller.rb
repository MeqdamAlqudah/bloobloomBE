class Api::Store::LensesController < ApplicationController
  def index
    lenses = Lense.all
    render json: lenses
  end
end
