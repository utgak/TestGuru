class AddModelsNotNill < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:answers, :question_id, false)
    change_column_null(:answers, :answer, false)
    change_column_null(:categories, :test_category, false)
    change_column_null(:categories, :test_id, false)
    change_column_null(:questions, :test_id, false)
    change_column_null(:questions, :correct_answer, false)
    change_column_null(:questions, :task, false)
    change_column_null(:tests, :title, false)
    change_column_null(:users, :access_rights, false)
    change_column_null(:users, :login, false)
    change_column_null(:users, :password, false)
  end
end
