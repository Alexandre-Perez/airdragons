class DragonsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @dragons = Dragon.where(sql_query, query: "%#{params[:query]}%")
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
