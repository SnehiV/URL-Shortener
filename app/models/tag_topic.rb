class TagTopic < ActiveRecord::Base


  has_many :shortened_urls,
    through: :taggings,
    source: :shortened_urls

  

end
