class Reservation < ApplicationRecord
  belongs_to :course_category
  belongs_to :course_sub_category
end
