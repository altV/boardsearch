class CreateFileManagers < ActiveRecord::Migration
  def self.up
    create_table :file_managers do |t|
      t.string "param", :limit => 100
      t.string "value", :limit => 5000
      t.timestamps
    end
  end

  def self.down
    drop_table :file_managers
  end
end
