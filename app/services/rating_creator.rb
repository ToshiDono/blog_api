class RatingCreator
  def initialize(params)
    @params = params
    @post = Post.find_by(id: params[:rating][:post_id])
  end

  def rating
    create_rating_record
    avg = average_rating
    update_post_average_rating(avg)
  end

  private

  def create_rating_record
    @post.ratings.create!(rating_params)
  end

  # return float
  def average_rating
    ActiveRecord::Base.connection.execute(query).values.first.first
  end

  # return float average rating
  def update_post_average_rating(avg)
    @post.rating = avg
    @post.save!
    @post.rating
  end

  def query
    "SELECT CAST(AVG(estimation) as float)
     FROM public.ratings
     WHERE post_id = #{post_id};"
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
