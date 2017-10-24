# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord

  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    dependent: :destroy,
    foreign_key: :artist_id

  has_many :artwork_shares,
    foreign_key: :viewer_id,
    dependent: :destroy

  has_many :shared_artworks,
    through: :artwork_shares,
    source: :artwork
end
