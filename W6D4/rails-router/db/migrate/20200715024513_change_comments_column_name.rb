class ChangeCommentsColumnName < ActiveRecord::Migration[5.2]
  def change
    change_table :comments do |t|
      t.rename :user_id, :author_id
    end
  end
end
