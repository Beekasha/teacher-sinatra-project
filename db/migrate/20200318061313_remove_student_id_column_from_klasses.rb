class RemoveStudentIdColumnFromKlasses < ActiveRecord::Migration
  def change
    remove_column :klasses, :student_id
  end
end
