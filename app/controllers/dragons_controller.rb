class DragonsController < ApplicationController
  def index
    @dragons = Dragon.all
  end

  def show
    @dragon = Dragon.find(params[:id])

    @markers = [
      {
        lat: @dragon.latitude,
        lng: @dragon.longitude
      }
    ]
  end

end
