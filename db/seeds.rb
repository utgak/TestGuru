# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!([{ login: 'user1', password: '12345', access_rights: 'admin' },
              { login: 'user2', password: '12345', access_rights: 'admin' },
              { login: 'user3', password: '12345', access_rights: 'admin' },
              { login: 'user4', password: '12345', access_rights: 'admin' }])

Category.create!([{ title: 'title1' },
                  { title: 'title2' },
                  { title: 'title3' },
                  { title: 'title4' }])

Test.create!([{ title: 'title1', level: 1, user_id: 1, category_id: 1 },
              { title: 'title2', level: 2, user_id: 2, category_id: 2 },
              { title: 'title3', level: 3, user_id: 3, category_id: 3 },
              { title: 'title4', level: 4, user_id: 4, category_id: 4 }])

PassedTest.create!([{ user_id: 1, test_id: 1, count: 0 },
                    { user_id: 2, test_id: 2, count: 0 },
                    { user_id: 3, test_id: 3, count: 0 },
                    { user_id: 4, test_id: 4, count: 0 }])

Question.create!([{ title: 'title1', test_id: 1 },
                  { title: 'title2', test_id: 1 },
                  { title: 'title3', test_id: 1 },
                  { title: 'title4', test_id: 1 }])

Answer.create!([{ title: 'title1', correct: true,  question_id: 1 },
                { title: 'title2', correct: false, question_id: 1 },
                { title: 'title3', correct: false, question_id: 1 },
                { title: 'title4', correct: false, question_id: 1 },
                { title: 'title1', correct: true,  question_id: 2 },
                { title: 'title2', correct: false, question_id: 2 },
                { title: 'title3', correct: false, question_id: 2 },
                { title: 'title4', correct: false, question_id: 2 },
                { title: 'title1', correct: true,  question_id: 3 },
                { title: 'title2', correct: false, question_id: 3 },
                { title: 'title3', correct: false, question_id: 3 },
                { title: 'title4', correct: false, question_id: 3 },
                { title: 'title1', correct: true,  question_id: 4 },
                { title: 'title2', correct: false, question_id: 4 },
                { title: 'title3', correct: false, question_id: 4 },
                { title: 'title4', correct: false, question_id: 4 }])
