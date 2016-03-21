class CreateCoursesubjects < ActiveRecord::Migration
  def change
    create_table :coursesubjects do |t|
      t.string :course_code
      t.string :course_name
      t.string :subject_id

      t.timestamps null: false
    end
  end
end
