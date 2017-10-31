# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :string
#  sub_id     :integer          not null
#  author_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord

  validates :title, :url, :content, :author_id, presence: true

  belongs_to :user,
    class_name: :User,
    foreign_key: :author_id

  has_many :post_subs,
    inverse_of: :post,
    dependent: :destroy

  has_many :subs,
    through: :post_subs,
    source: :sub
end
