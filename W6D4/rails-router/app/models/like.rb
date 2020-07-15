# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  likeable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  likeable_id   :bigint
#  user_id       :bigint
#
# Indexes
#
#  index_likes_on_likeable_type_and_likeable_id  (likeable_type,likeable_id)
#  index_likes_on_user_id                        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Like < ApplicationRecord
  validates :user_id, presence:true, uniqueness: {scope:  }
  validates :likeable_id, :likeable_type, presence: true
  
  belongs_to :user
  belongs_to :likeable, polymorphic: true
  
end

# like
# user_id likeable_id likeable_type
#   1         1          artwork
#   2         2          comment
