# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text
#  title      :string           not null
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
#  sub_id     :bigint           not null
#
# Indexes
#
#  index_posts_on_author_id  (author_id)
#  index_posts_on_sub_id     (sub_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (sub_id => subs.id)
#
class Post < ApplicationRecord
  validates :title, presence:true

  belongs_to :sub
  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User
 
end
