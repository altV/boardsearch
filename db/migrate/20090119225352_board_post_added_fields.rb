class BoardPostAddedFields < ActiveRecord::Migration
  def self.up
    add_column :board_posts, :title, :string
    add_column :board_posts, :body,  :text
  end

  def self.down
    remove_column :board_posts, :title
    remove_column :board_posts, :body
  end
end
