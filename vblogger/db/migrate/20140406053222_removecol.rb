class Removecol < ActiveRecord::Migration
  def change
  end
  def self.up
  	remove_column :posts, :blog_id
  end
end
