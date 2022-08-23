class DragonsController < ApplicationController
  def index
    @dragons = Dragon.all
  end

  def show
    @dragons = Dragon.find(params[:id])
  end
end
