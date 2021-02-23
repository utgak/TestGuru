class DropTablePassedTests < ActiveRecord::Migration[5.2]
  def up
    drop_table :passed_tests
  end
end
