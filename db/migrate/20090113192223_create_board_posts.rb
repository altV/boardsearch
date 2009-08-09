class CreateBoardPosts < ActiveRecord::Migration
  def self.up
    create_table :board_posts do |t|
      t.timestamps
    end
  end

  def self.down
    drop_table :board_posts
  end
end
