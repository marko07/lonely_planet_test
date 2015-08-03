class DestinationsController < ApplicationController
  def create
    Destination.create(destinations_params)
  end

  private

  def destinations_params
    params.require(:destination).permit(:path)
  end
end
