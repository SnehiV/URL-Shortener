class ShortenedUrl < ActiveRecord::Base
  validates :short_url, :long_url, uniqueness: true
  validate :long_url, length: { :maximum => 500 }

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :user

  has_many :visits,
    primary_key: :id,
    foreign_key: :short_id,
    class_name: 'Visit'

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: 'user'

  has_many :tag_topics,
    through: :taggings,
    source: :tag_topics

  def self.random_code
    loop do
      code = SecureRandom::urlsafe_base64(16)
      return code unless ShortenedUrl.exists?(code)
    end
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create!(
      user_id: user.id,
      long_url: long_url,
      short_url: ShortenedUrl.random_code
      )
  end

  def num_clicks
    visits.count
  end

  def num_uniques
    visitors.count
  end

  def num_recent_uniques
    visits.select('user_id').distinct.where("created_at < ?", 10.minutes.ago).count
  end

end
