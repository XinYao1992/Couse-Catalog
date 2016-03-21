class AddSubjectNameToCoursesubject < ActiveRecord::Migration
  def change
    add_column :coursesubjects, :subject_name, :string
  end
end
