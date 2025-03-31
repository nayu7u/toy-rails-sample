class CourseCategory < ApplicationRecord
  has_many :course_sub_categories, dependent: :destroy
end
