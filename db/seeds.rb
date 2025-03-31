# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

ActiveRecord::Base.transaction do
  [ "Vim", "Emacs", "Visual Studio Code" ].each do |editor_name|
    Vote.find_or_create_by!(name: editor_name)
  end

  CourseCategory.find_or_create_by!(name: "Programming") do |category|
    category.course_sub_categories.build(name: "Ruby")
    category.course_sub_categories.build(name: "JavaScript")
    category.course_sub_categories.build(name: "Python")
  end

  CourseCategory.find_or_create_by!(name: "Language") do |category|
    category.course_sub_categories.build(name: "English")
    category.course_sub_categories.build(name: "Spanish")
    category.course_sub_categories.build(name: "French")
  end

  CourseCategory.find_or_create_by!(name: "ビジネススキル") do |category|
    category.course_sub_categories.build(name: "マネジメント")
    category.course_sub_categories.build(name: "マーケティング")
    category.course_sub_categories.build(name: "営業")
  end
end
