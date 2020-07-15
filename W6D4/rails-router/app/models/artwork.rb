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
class Artwork < ApplicationRecord
    validates :artist_id, presence: true, uniqueness:{ scope: :title }
    validates :image_url, presence: true, uniqueness: true
    validates :title, presence: true, uniqueness:{ scope: :artist_id }


    belongs_to :artist,
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :User

    has_many :views,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare

    has_many :comments, dependent: :destroy,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Comment

    has_many :shared_viewers, through: :views, source: :viewer
        

    has_many :likes, as: :likeable 


end
