# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  year       :integer          not null
#  band_id    :integer          not null
#  live       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord

  validates :title, presence: true
  validates :year, presence: true
  validates :band_id, presence: true
  validates :live, presence: true

  belongs_to :band,
    class_name: :Band,
    foreign_key: :band_id

  has_many :tracks,
    class_name: :Track,
    foreign_key: :album_id,
    dependent: :destroy
end
