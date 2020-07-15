# == Schema Information
#
# Table name: comments
#
#  id         :bigint           not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artwork_id :bigint
#  author_id  :bigint
#
# Indexes
#
#  index_comments_on_artwork_id  (artwork_id)
#  index_comments_on_author_id   (author_id)
#
# Foreign Keys
#
#  fk_rails_...  (artwork_id => artworks.id)
#  fk_rails_...  (author_id => users.id)
#
class Comment < ApplicationRecord
  validates :author_id, :artwork_id, presence:true
  
  belongs_to :author,
    foreign_key: :author_id,
    primary_key: :id,
    class_name: :User
    
  belongs_to :artwork

  has_many :likes, as: :likeable 
    
  
end
