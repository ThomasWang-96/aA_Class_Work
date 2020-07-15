# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  image_url  :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :integer
#
# Indexes
#
#  index_artworks_on_artist_id  (artist_id)
#
require 'test_helper'

class ArtworkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
