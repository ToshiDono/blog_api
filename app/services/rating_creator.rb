class RatingCreator
  def initialize(params)
    @params = params
  end

  def average_rating
    post.rating = sum_of_estimates.to_f / count_estimates
    post.save!
    post.rating
  end

  private

  def sum_of_estimates
    ratings.reduce(0) { |accumulator, element| accumulator + element.estimation }
  end

  def count_estimates
    ratings.size
  end

  def ratings
    new_rating
    post.ratings
  end

  def new_rating
    @new_rating ||= Rating.create!(rating_params)
  end

  def post
    @post ||= Post.find(post_id)
  end

  def rating_params
    {
        post_id: post_id,
        estimation: @params[:rating][:estimation]
    }
  end

  def post_id
    @params[:rating][:post_id]
  end
end
