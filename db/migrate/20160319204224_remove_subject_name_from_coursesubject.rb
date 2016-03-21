class RemoveSubjectNameFromCoursesubject < ActiveRecord::Migration
  def change
    remove_column :coursesubjects, :subject_name, :string
  end
end
