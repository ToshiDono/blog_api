4000.times do
  Rating.create!(
      estimation: rand(1..5),
      post_id: rand(1..200)
  )
end
