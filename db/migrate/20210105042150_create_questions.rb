class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :test, foreign_key: true, null: false
      t.string :task
      t.string :correct_answer

      t.timestamps
    end
  end
end
