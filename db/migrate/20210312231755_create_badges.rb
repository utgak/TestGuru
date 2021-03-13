class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :title
      t.string :img
      t.string :condition
      t.string :option

      t.timestamps
    end
  end
end
