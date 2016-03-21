class DropEnrollment < ActiveRecord::Migration
  def change
    drop_table :enrollments
  end
end
