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
require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
