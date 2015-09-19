class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(
      restaurant_id: params[:restaurant_id],
      user_id: current_user.id,
      rate: review_params["rate"]
      body: review_params["body"]
      )
    if @review.save
      redirect_to restaurant_url(@review.restaurant)
    else
      render :new
    end
  end
end
