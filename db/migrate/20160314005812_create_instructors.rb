class CreateInstructors < ActiveRecord::Migration
  def change
    create_table :instructors do |t|
      t.string :instructor_id
      t.string :instructor_email
      t.string :first
      t.string :middle
      t.string :last

      t.timestamps null: false
    end
  end
end
