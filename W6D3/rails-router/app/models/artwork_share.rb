# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artwork_id :integer
#  viewer_id  :integer
#
# Indexes
#
#  index_artwork_shares_on_artwork_id  (artwork_id)
#  index_artwork_shares_on_viewer_id   (viewer_id)
#
class ArtworkShare < ApplicationRecord
    validates :artwork_id, :viewer_id, presence:true

    belongs_to :artwork,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Artwork

    belongs_to :viewer,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :User

    
end
