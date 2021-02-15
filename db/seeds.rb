# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!([{ login: 'user1', password: '12345', access_rights: 'user' },
                      { login: 'user2', password: '12345', access_rights: 'user' },
                      { login: 'user3', password: '12345', access_rights: 'user' },
                      { login: 'user4', password: '12345', access_rights: 'user' }])

categories = Category.create!([{ title: 'title1' },
                               { title: 'title2' },
                               { title: 'title3' },
                               { title: 'title4' }])

tests = Test.create!([{ title: 'title1', level: 1, author: users[0], category: categories[0] },
                      { title: 'title1', level: 2, author: users[1], category: categories[1] },
                      { title: 'title3', level: 3, author: users[2], category: categories[2] },
                      { title: 'title4', level: 4, author: users[3], category: categories[3] }])

PassedTest.create!([{ user: users[0], test: tests[0], count: 0 },
                    { user: users[1], test: tests[1], count: 0 },
                    { user: users[2], test: tests[3], count: 0 },
                    { user: users[3], test: tests[3], count: 0 }])

questions = Question.create!([{ title: 'title1', test: tests[0] },
                              { title: 'title2', test: tests[0] },
                              { title: 'title3', test: tests[0] },
                              { title: 'title4', test: tests[0] },
                              { title: 'title2', test: tests[1] },
                              { title: 'title3', test: tests[2] },
                              { title: 'title4', test: tests[3] }])

Answer.create!([{ title: 'title1', correct: true,  question: questions[0] },
                { title: 'title2', correct: false, question: questions[0] },
                { title: 'title3', correct: false, question: questions[0] },
                { title: 'title4', correct: false, question: questions[0] },
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
                { title: 'title4', correct: false, question: questions[3] }])
