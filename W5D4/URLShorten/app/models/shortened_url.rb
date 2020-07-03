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
require 'securerandom'

class ShortenedUrl < ApplicationRecord
    def self.random_code
        new = SecureRandom.urlsafe_base64
        while shortened_urls.exists?(new)
            new = SecureRandom.urlsafe_base64
        end
        return new
    end

    def self.short_url_create(user, url)
        ShortenedUrl.create!(long_url: url, user_id: user.id)
    end

    belongs_to :submitter,
        primary_key: :id, 
        foreign_key: :user_id,
        class_name: :User

end
