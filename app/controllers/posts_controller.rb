class PostsController < ApplicationController
  def create
    @post = PostCreator.run(post_params)
    if @post.valid?
      render json: @post, status: 200
    else
      render json: @post, status: 422
    end
  end

  private

  def post_params
    params.permit(:login, post: [:title, :body, :author_ip])
  end
end
