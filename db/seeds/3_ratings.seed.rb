4000.times do
  RatingCreator.new(
      rating: {
          estimation: rand(1..5),
          post_id: rand(1..200)
      }).rating
end
