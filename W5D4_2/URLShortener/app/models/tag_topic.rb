# == Schema Information
#
# Table name: tag_topics
#
#  id         :bigint           not null, primary key
#  topic      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TagTopic < ApplicationRecord
    validates :topic, presence:true, uniqueness:true

    has_many :taggings,
    primary_key: :id,
    foreign_key: :tag_topic_id,
    class_name: :Tagging

    has_many :shortened_urls,
    through: :taggings,
    source: :shortened_url
    

    def popular_links
        arr = shortened_urls.sort_by {|link| link.num_clicks }
        arr.reverse!
        arr[0...5]
    end

end

# SELECT *
# FROM tag_topics tp

# JOIN taggings ta ON tp.id = ta.tag_topic_id
# JOIN shortened_urls s ON ta.shortened_url_id = s.id
# JOIN visits v ON s.id = v.shortened_url_id

# GROUP BY tp.topic
# ORDER BY COUNT(v.user_id) DESC
# LIMIT 5

# def popular_links
#     shortened_urls.joins(:visits)
#       .group(:short_url, :long_url)
#       .order('COUNT(visits.id) DESC')
#       .select('long_url, short_url, COUNT(visits.id) as number_of_visits')
#       .limit(5)
#   end