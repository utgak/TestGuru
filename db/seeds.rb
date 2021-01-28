# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1, user2, user3, user4 = User.create!([{ login: 'user1', password: '12345', access_rights: 'admin' },
                                          { login: 'user2', password: '12345', access_rights: 'admin' },
                                          { login: 'user3', password: '12345', access_rights: 'admin' },
                                          { login: 'user4', password: '12345', access_rights: 'admin' }])

category1, category2, category3, category4 = Category.create!([{ title: 'title1' },
                                                               { title: 'title2' },
                                                               { title: 'title3' },
                                                               { title: 'title4' }])

test1, test2, test3, test4 = Test.create!([{ title: 'title1', level: 1, user_id: user1.id, category_id: category1.id },
                                           { title: 'title2', level: 2, user_id: user2.id, category_id: category2.id },
                                           { title: 'title3', level: 3, user_id: user3.id, category_id: category3.id },
                                           { title: 'title4', level: 4, user_id: user4.id, category_id: category4.id }])

PassedTest.create!([{ user_id: user1.id, test_id: test1.id, count: 0 },
                    { user_id: user2.id, test_id: test2.id, count: 0 },
                    { user_id: user3.id, test_id: test3.id, count: 0 },
                    { user_id: user4.id, test_id: test4.id, count: 0 }])

question1, question2, question3, question4 = Question.create!([{ title: 'title1', test_id: test1.id },
                                                               { title: 'title2', test_id: test1.id },
                                                               { title: 'title3', test_id: test1.id },
                                                               { title: 'title4', test_id: test1.id }])

Answer.create!([{ title: 'title1', correct: true,  question_id: question1.id },
                { title: 'title2', correct: false, question_id: question1.id },
                { title: 'title3', correct: false, question_id: question1.id },
                { title: 'title4', correct: false, question_id: question1.id },
                { title: 'title1', correct: true,  question_id: question2.id },
                { title: 'title2', correct: false, question_id: question2.id },
                { title: 'title3', correct: false, question_id: question2.id },
                { title: 'title4', correct: false, question_id: question2.id },
                { title: 'title1', correct: true,  question_id: question3.id },
                { title: 'title2', correct: false, question_id: question3.id },
                { title: 'title3', correct: false, question_id: question3.id },
                { title: 'title4', correct: false, question_id: question3.id },
                { title: 'title1', correct: true,  question_id: question4.id },
                { title: 'title2', correct: false, question_id: question4.id },
                { title: 'title3', correct: false, question_id: question4.id },
                { title: 'title4', correct: false, question_id: question4.id }])
