# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  short_url  :string
#  long_url   :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord

  require 'securerandom'

  validates :short_url, :long_url, presence: true, uniqueness: true

  belongs_to :submitter,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  has_many :visitors,
    Proc.new { distinct },
    through: :visits,
    source: :visitors


  def self.random_code(user, long_url)
    new_url = SecureRandom.urlsafe_base64
    until !ShortenedUrl.exists?(new_url)
      new_url = SecureRandom.urlsafe_base64
    end
    ShortenedUrl.create(user_id: user.id, short_url: new_url, long_url: long_url)
  end

  # initializing well overwrite previously defined variables in our schema

  def num_clicks(shortened_url_id)

  end

  def num_uniques
    URLShortener_development.instance.execute(<<-SQL, shortened_url_id)
    SELECT
    COUNT(DISTINCT user_id)
    FROM
    visits
    WHERE
    visits.shortened_url_id = ?
    SQL

  end

  def num_recent_uniques

  end
end
