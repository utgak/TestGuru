class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :correct_answer, null: false
      t.references :test, foreign_key: true, null: false

      t.timestamps
    end
  end
end
