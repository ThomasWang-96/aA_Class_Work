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
    validates :long_url, presence: true

    def self.random_code
        new = SecureRandom.urlsafe_base64
        while ShortenedUrl.exists?(new)
            new = SecureRandom.urlsafe_base64
        end
        return new
    end

    def self.short_url_create(user, url)
        ShortenedUrl.create!(long_url: url, user_id: user.id, short_url: ShortenedUrl.random_code)
    end

    belongs_to :submitter,
        primary_key: :id, 
        foreign_key: :user_id,
        class_name: :User
    
    has_many :visits,
        primary_key: :id,
        foreign_key: :shortened_url_id,
        class_name: :Visit
    
    has_many :visitors,
        -> { distinct },
        through: :visits,
        source: :visitor


    def num_clicks
        visits.count
    end

    def num_unique
        visitors.count
    end

    def num_recent_uniques
        visits
            .select(:user_id)
            .where('created_at > ?', 10.minutes.ago)
            .distinct
            .count
    end

end

