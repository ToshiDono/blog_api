class RatingCreator
  def initialize(params)
    @params = params
  end

  def rating
    set_rating
    @rating
  end

  private

  def set_rating
    post.rating = average_rating
    post.save!
  end

  def average_rating
    new_rating
    @rating ||= ActiveRecord::Base.connection.execute(query).values.first
  end

  def query
    "SELECT CAST(AVG(estimation) as float)
     FROM public.ratings
     WHERE post_id = #{post_id};"
  end

  def post
    @post ||= new_rating.post
  end

  def new_rating
    @new_rating ||= Rating.create!(rating_params)
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
