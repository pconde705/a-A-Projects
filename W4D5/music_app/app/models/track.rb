# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  band_id    :integer          not null
#  title      :string           not null
#  ord        :integer          not null
#  lyrics     :text
#  bonus      :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord

  validates :album_id, presence: true
  validates :band_id, presence: true
  validates :title, presence: true
  validates :ord, presence: true
  validates :bonus, presence: true

  belongs_to :album,
    class_name: :Album,
    foreign_key: :album_id

  belongs_to :band,
    class_name: :Band,
    foreign_key: :band_id

end
