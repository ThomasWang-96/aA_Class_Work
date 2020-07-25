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
require 'test_helper'

class PostSubTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
