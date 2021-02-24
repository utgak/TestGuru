class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :login, null: false
      t.string :password, null: false
      t.string :access_rights, null: false

      t.timestamps
    end
  end
end
