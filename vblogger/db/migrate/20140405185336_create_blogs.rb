class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :blogid
      t.string :bloggerid
      t.string :blogtitle
      t.text :blogdescription
      t.integer :numberofposts

      t.timestamps
    end
  end
end
