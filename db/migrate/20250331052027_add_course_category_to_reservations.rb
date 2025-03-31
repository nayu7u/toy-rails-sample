class AddCourseCategoryToReservations < ActiveRecord::Migration[8.0]
  def change
    add_reference :reservations, :course_category, null: false, foreign_key: true
  end
end
