class CreatePostSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :post_subs do |t|
      t.references :post, foreign_key: true
      t.references :sub, foreign_key: true

      t.timestamps
    end
  end
end
