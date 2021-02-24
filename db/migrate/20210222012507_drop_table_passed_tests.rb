class DropTablePassedTests < ActiveRecord::Migration[5.2]
  def change
    drop_table :passed_tests, if_exists: true
  end
end
