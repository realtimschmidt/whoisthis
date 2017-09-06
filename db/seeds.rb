require 'random_data'

#Create Quizzes
4.times do
  Quiz.create!(
    title: Faker::Space.galaxy
  )
end
quizzes = Quiz.all

#Create Cards
20.times do
  Card.create!(
    quiz: quizzes.sample,
    image: RandomData.random_sentence,
    photo: Faker::Avatar.image,
    name: Faker::Name.name,
    role: Faker::Job.title,
    company: Faker::Company.name,
    city: Faker::Address.city,
    school: Faker::Educator.university
  )
end

puts "Seed finished"
puts "#{Quiz.count} quizzes created"
puts "#{Card.count} cards created"
