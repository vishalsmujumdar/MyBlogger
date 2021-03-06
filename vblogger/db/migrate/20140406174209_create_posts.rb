class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :postid
      t.string :blogid
      t.string :bloggerid
      t.string :title
      t.text :content
      t.references :blog, index: true

      t.timestamps
    end
  end
end
