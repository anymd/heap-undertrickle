require 'faker'

User.destroy_all
Question.destroy_all
Answer.destroy_all
Response.destroy_all
Vote.destroy_all

10.times do

  User.create(:email => Faker::Internet.email, :name => Faker::Name.name, :password => 'puppy')

end

20.times do

  user = User.all.sample

  user.questions.create(title: Faker::Lorem.sentences([1]).join, text: Faker::Lorem.sentences([2,3,4,5,6].sample).join)

end

50.times do

	question = Question.all.sample

	rand(1..5).times do	
	  answer = question.answers.create(text: Faker::Lorem.sentences([2,3,4,5,6].sample).join)
	  answer.user = User.all.sample
	  answer.save
    end

end


  