class DragonsController < ApplicationController
  def index
      if params[:query].present?
        @dragons = Dragon.where("name ILIKE ?", "%#{params[:query]}%")
      else
        @dragons = Dragon.all
      end
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
