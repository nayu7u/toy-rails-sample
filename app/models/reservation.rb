class Reservation < ApplicationRecord
  belongs_to :course_category
  belongs_to :course_sub_category
  validate :course_sub_category_must_be_course_category_child, if: :course_sub_category_id_changed?

  private

  def course_sub_category_must_be_course_category_child
    if course_category.course_sub_categories.exclude?(course_sub_category)
      errors.add(:course_sub_category, "must be a sub-category of the selected course category")
    end
  end
end
