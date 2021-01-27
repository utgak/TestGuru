# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create!(login: 'user1', password: '12345', access_rights: 'admin')
category = Category.create!(title: 'history')
test = Test.create!(title: 'title', level: 1, user: user, category: category)
pt = PassedTest.create!(user: user, test: test, count: 1)
question = Question.create!(title: 'title', test: test)
answer = Answer.create!(title: 'title', correct: false, question: question)
user2 = User.create!(login: 'user2', password: '12345', access_rights: 'admin')
category2 = Category.create!(title: 'history')
test2 = Test.create!(title: 'title2', level: 1, user: user2, category: category2)
pt2 = PassedTest.create!(user: user2, test: test2, count: 1)
question2 = Question.create!(title: 'title2', test: test2)
answer2 = Answer.create!(title: 'title2', correct: false, question: question2)
