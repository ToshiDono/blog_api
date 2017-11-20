ips= []
50.times { |n| ips << "192.168.2.#{n+1}" }

200.times do
  Post.create!(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph,
      author_ip: ips[rand(1..50)],
      user_id: rand(1..100)
  )
end
