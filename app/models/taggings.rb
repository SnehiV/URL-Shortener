class Taggings < ActiveRecord::Base

  belongs_to :shortened_urls,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: 'ShortenedUrl'

  belongs_to :tag_topics,
    primary_key: :id,
    foreign_key: :tag_id,
    class_name: 'TagTopics'
end
