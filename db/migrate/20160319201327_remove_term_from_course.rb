class RemoveTermFromCourse < ActiveRecord::Migration
  def change
    remove_column :courses, :term, :string
  end
end
