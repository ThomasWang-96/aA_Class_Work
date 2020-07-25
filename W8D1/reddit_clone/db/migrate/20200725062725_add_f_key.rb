class AddFKey < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :parent_comment, index:true
  end
end
