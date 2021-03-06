class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null:false
      t.string :url
      t.text :content
      t.references :sub, foreign_key: true, null:false
      t.references :user, foreign_key: true, null:false

      t.timestamps
    end
  end
end
