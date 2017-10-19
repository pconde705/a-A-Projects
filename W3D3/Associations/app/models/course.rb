# == Schema Information
#
# Table name: courses
#
#  id            :integer          not null, primary key
#  name          :string
#  prereq_id     :integer
#  instructor_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Course < ApplicationRecord

  has_many :enrollments, #If one association to a class is written that class needs to write an asssociation back.
    class_name: :Enrollment, # You will almost never write a belongs_to towards another belongs_to, its almost always...
    primary_key: :id, # ...has_many to belongs_to
    foreign_key: :course_id

  has_many :students, #This can be named something else as long as you've got your associations correctly set up
    through: :enrollments,
    source: :courses #This has to be named the same as whatever you've written in the belongs_to:

  belongs_to :prerequisites,
    optional: true,
    class_name: :Course,
    primary_key: :id,
    foreign_key: :prereq_id

  belongs_to :instructor,
    class_name: :User,
    primary_key: :id,
    foreign_key: :instructor_id

end
