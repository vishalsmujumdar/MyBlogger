class CreateBloggers < ActiveRecord::Migration
  def change
    create_table :bloggers do |t|
      t.string :bloggerid
      t.string :name
      t.string :username
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
#blogger1 = Blogger.create(:bloggerid => "blogger1",:name => "Vishal Mujumdar",:username => "vishal",:email => "vishalatthehorizon@gmail.com",:password => "vishal")
#blogger2 = Blogger.create(:bloggerid => "blogger2",:name => "Aastha Kesarwani",:username => "aastha",:email => "aastha.baloda@gmail.com",:password => "aastha")