class ReviewsController < ApplicationController
  before_action :set_review, only: %i[new create destroy]
  # def index
  # end

  # def show
  # end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.dragon = @dragon
    if @review.save
      redirect_to dragon_path(@dragon)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to dragon_path(@review.dragon), status: :see_other
  end

  private

  def set_review
    @dragon = Dragon.find(params[:dragon_id])
  end

  def review_params
    params.require(:review).permit(:comment)
  end
end
