require 'random_data'

#Create Quizzes
4.times do
  Quiz.create!(
    title: Faker::Name.title
  )
end
quizzes = Quiz.all

#Create Cards
20.times do
  Card.create!(
    quiz: quizzes.sample,
    image: RandomData.random_sentence,
    name: Faker::Name.title,
    role: Faker::Job.title,
    city: Faker::Address.city,
    school: Faker::Educator.university
  )
end

puts "Seed finished"
puts "#{Quiz.count} quizzes created"
puts "#{Card.count} cards created"
