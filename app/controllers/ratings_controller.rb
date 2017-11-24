class RatingsController < ApplicationController
  def create
    @rating = RatingCreator.new(rating_params).rating
    if @rating
      render json: @rating, status: 200
    else
      render json: @rating, status: 422
    end
  end

  private

  def rating_params
    params.permit(rating: [:post_id, :estimation])
  end
end
