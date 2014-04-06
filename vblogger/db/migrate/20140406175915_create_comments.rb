class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commentid
      t.string :postid
      t.string :bloggerid
      t.text :commenttext
      t.references :post, index: true

      t.timestamps
    end
  end
end
