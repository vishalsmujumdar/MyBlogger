class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :blogid
      t.string :postid
      t.string :bloggerid
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
#post = Post.create(:blogid=>"blog1",:postid=>"post1",:bloggerid=>"blogger1",:title=>"post 1",:content=>"content of 1st post")