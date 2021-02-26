# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([{ email: 'user@example.com', password: '12345' },
                      { email: 'user1@example.com', password: '12345' }])

categories = Category.create!([{ title: 'title1' },
                               { title: 'title2' },
                               { title: 'title3' },
                               { title: 'title4' }])

tests = Test.create!([{ title: 'title1', level: 1, author: users[0], category: categories[0] },
                      { title: 'title1', level: 2, author: users[0], category: categories[1] }])

questions = Question.create!([{ title: 'title1', test: tests[0] },
                              { title: 'title2', test: tests[0] },
                              { title: 'title3', test: tests[0] },
                              { title: 'title4', test: tests[0] },
                              { title: 'title1', test: tests[1] },
                              { title: 'title2', test: tests[1] },
                              { title: 'title3', test: tests[1] },
                              { title: 'title4', test: tests[1] },
                              { title: 'title1', test: tests[1] },
                              { title: 'title2', test: tests[1] }])

Answer.create!([{ title: 'title1', correct: true,  question: questions[0] },
                { title: 'title2', correct: false, question: questions[0] },
                { title: 'title3', correct: false, question: questions[0] },
                { title: 'title1', correct: true,  question: questions[1] },
                { title: 'title2', correct: false, question: questions[1] },
                { title: 'title3', correct: false, question: questions[1] },
                { title: 'title4', correct: false, question: questions[1] },
                { title: 'title1', correct: true,  question: questions[2] },
                { title: 'title2', correct: false, question: questions[2] },
                { title: 'title3', correct: false, question: questions[2] },
                { title: 'title4', correct: false, question: questions[2] },
                { title: 'title1', correct: true,  question: questions[3] },
                { title: 'title2', correct: false, question: questions[3] },
                { title: 'title3', correct: false, question: questions[3] },
                { title: 'title4', correct: false, question: questions[3] },
                { title: 'title1', correct: true,  question: questions[4] },
                { title: 'title2', correct: false, question: questions[4] },
                { title: 'title3', correct: false, question: questions[5] },
                { title: 'title1', correct: true,  question: questions[5] },
                { title: 'title2', correct: true,  question: questions[6] },
                { title: 'title3', correct: false, question: questions[6] },
                { title: 'title4', correct: false, question: questions[7] },
                { title: 'title1', correct: true,  question: questions[7] },
                { title: 'title2', correct: true,  question: questions[8] },
                { title: 'title3', correct: false, question: questions[8] },
                { title: 'title4', correct: false, question: questions[9] },
                { title: 'title1', correct: true,  question: questions[9] }])
