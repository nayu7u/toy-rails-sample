class AddCourseSubCategoryToReservations < ActiveRecord::Migration[8.0]
  def change
    add_reference :reservations, :course_sub_category, null: false, foreign_key: true
  end
end
