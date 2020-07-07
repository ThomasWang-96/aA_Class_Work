# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string
#  short_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_shortened_urls_on_short_url  (short_url)
#  index_shortened_urls_on_user_id    (user_id)
#
require 'test_helper'

class ShortenedUrlTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
