class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.string :website
      t.text :content
      
      t.references :post
      
      t.timestamps null: false
    end
  end
end
