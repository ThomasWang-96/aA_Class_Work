class CreateVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :visits do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :shortened_url, foreign_key: true

      t.timestamps
    end
  end
end
