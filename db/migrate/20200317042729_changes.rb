class Changes < ActiveRecord::Migration
  def change
    drop_table :klasses_students
    add_column :klasses, :student_id, :integer

  end
end
