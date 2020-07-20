class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.references :band, foreign_key: true
      t.string :title
      t.integer :year
      t.boolean :live, default:false
      
      t.timestamps
    end
  end
end

