class PostCreator
  class << self
    def run(params)
      new(params).run
    end
  end

  def initialize(params)
    @params = params
  end

  def run
    user.posts.create!(post_params)
  end

  private

  def post_params
    {
        title: @params[:post][:title],
        body: @params[:post][:body],
        author_ip: @params[:post][:author_ip]
    }
  end

  def user
    # TODO: use find_or_initialize_by
    @user ||= User.find_by(login: login) || create_user
  end

  def create_user
    User.create!(login: login)
  end

  def login
    @params[:login]
  end
end
