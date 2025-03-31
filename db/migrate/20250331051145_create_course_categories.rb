class CreateCourseCategories < ActiveRecord::Migration[8.0]
  def change
    create_table :course_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
