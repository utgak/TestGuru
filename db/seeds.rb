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

tests = Test.create!([{ title: 'title1', level: 1, user_id: users[0].id, category_id: categories[0].id },
                      { title: 'title2', level: 2, user_id: users[1].id, category_id: categories[1].id },
                      { title: 'title3', level: 3, user_id: users[2].id, category_id: categories[2].id },
                      { title: 'title4', level: 4, user_id: users[3].id, category_id: categories[3].id }])

PassedTest.create!([{ user_id: users[0].id, test_id: tests[0].id, count: 0 },
                    { user_id: users[1].id, test_id: tests[1].id, count: 0 },
                    { user_id: users[2].id, test_id: tests[3].id, count: 0 },
                    { user_id: users[3].id, test_id: tests[3].id, count: 0 }])

questions = Question.create!([{ title: 'title1', test_id: tests[0].id },
                              { title: 'title2', test_id: tests[1].id },
                              { title: 'title3', test_id: tests[2].id },
                              { title: 'title4', test_id: tests[3].id }])

Answer.create!([{ title: 'title1', correct: true,  question_id: questions[0].id },
                { title: 'title2', correct: false, question_id: questions[0].id },
                { title: 'title3', correct: false, question_id: questions[0].id },
                { title: 'title4', correct: false, question_id: questions[0].id },
                { title: 'title1', correct: true,  question_id: questions[1].id },
                { title: 'title2', correct: false, question_id: questions[1].id },
                { title: 'title3', correct: false, question_id: questions[1].id },
                { title: 'title4', correct: false, question_id: questions[1].id },
                { title: 'title1', correct: true,  question_id: questions[2].id },
                { title: 'title2', correct: false, question_id: questions[2].id },
                { title: 'title3', correct: false, question_id: questions[2].id },
                { title: 'title4', correct: false, question_id: questions[2].id },
                { title: 'title1', correct: true,  question_id: questions[3].id },
                { title: 'title2', correct: false, question_id: questions[3].id },
                { title: 'title3', correct: false, question_id: questions[3].id },
                { title: 'title4', correct: false, question_id: questions[3].id }])
