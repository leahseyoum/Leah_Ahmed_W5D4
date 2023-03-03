# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    belongs_to :enrollment,
        primary_key: :id,
        foreign_key: :users_id,
        class_name: :Enrollment

    has_many :enrollments,
        primary_key: :id,
        foreign_key: :enrollments_id,
        class_name: :Enrollment

    has_many :enrolled_courses,
        through: :enrollments,
        source: :course

    #
    #many enrolled courses
    #through our last association that we made, (has_one)
    #source : course table  
end
