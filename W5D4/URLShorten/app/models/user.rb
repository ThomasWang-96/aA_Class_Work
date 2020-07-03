# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email)
#
class User < ApplicationRecord
    validates :email, presence: true, uniqueness: true

     has_many :submitter_urls,
        primary_key: :id, 
        foreign_key: :user_id,
        class_name: :ShortenedUrl
end
