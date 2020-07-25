# == Schema Information
#
# Table name: post_subs
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :bigint
#  sub_id     :bigint
#
# Indexes
#
#  index_post_subs_on_post_id  (post_id)
#  index_post_subs_on_sub_id   (sub_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#  fk_rails_...  (sub_id => subs.id)
#
class PostSub < ApplicationRecord
  validates :sub_id, uniqueness: { scope: :post_id }
  belongs_to :post
  belongs_to :sub
end
