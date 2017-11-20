100.times do |n|
  User.create!(login: "user#{n+1}@email.com")
end
