class FKey < ActiveRecord::Migration[5.2]
  def change
      add_foreign_key "comments", "comments", column: "parent_comment_id"
  end
end
