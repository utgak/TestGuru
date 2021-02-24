class DropTablePassedTests < ActiveRecord::Migration[5.2]
  def up
    drop_table :passed_tests
  end

  def down
    create_table :passed_tests do |t|
      t.references :user, foreign_key: true, null: false
      t.references :test, foreign_key: true, null: false
      t.integer :count, null: false

      t.timestamps
    end
  end
end
