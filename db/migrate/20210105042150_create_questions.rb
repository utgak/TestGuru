class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :test_id
      t.string :task
      t.string :correct_answer

      t.timestamps
    end
  end
end
