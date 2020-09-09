class ReviewsController < ApplicationController
  before_action :find_restaurant, only: %i[new create]

  def new
    @review = Review.new
    @review.restaurant = @restaurant
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to @restaurant
    else
      render :new # need to find syntax for how to redirect to show page
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
