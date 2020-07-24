# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  description  :text
#  title        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  moderator_id :bigint           not null
#
# Indexes
#
#  index_subs_on_moderator_id  (moderator_id)
#
# Foreign Keys
#
#  fk_rails_...  (moderator_id => users.id)
#
require 'test_helper'

class SubTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
