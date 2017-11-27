class AverageRatingsController < ApplicationController
  def index
    @posts = Post.select(:title, :body).order(rating: :desc).limit(params[:quantity])
    render json: @posts, status: 200
  end
end
