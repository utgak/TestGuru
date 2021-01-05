class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.integer :test_id
      t.string :test_category

      t.timestamps
    end
  end
end
