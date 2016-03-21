class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.string :email
      t.string :course_code
      t.string :course_name
      t.string :subject_id

      t.timestamps null: false
    end
  end
end
