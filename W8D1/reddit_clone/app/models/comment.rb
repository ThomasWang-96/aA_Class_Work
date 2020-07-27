# == Schema Information
#
# Table name: comments
#
#  id                :bigint           not null, primary key
#  content           :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  author_id         :bigint
#  parent_comment_id :bigint
#  post_id           :bigint
#
# Indexes
#
#  index_comments_on_author_id          (author_id)
#  index_comments_on_parent_comment_id  (parent_comment_id)
#  index_comments_on_post_id            (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (parent_comment_id => comments.id)
#  fk_rails_...  (post_id => posts.id)
#
class Comment < ApplicationRecord
  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User
 
  belongs_to :post
  
  belongs_to :parent_comment, optional:true,
    foreign_key: :parent_comment_id,
    primary_key: :id,
    class_name: :Comment
  
  has_many :child_comments, 
    foreign_key: :parent_comment_id,
    primary_key: :id,
    class_name: :Comment

end
