class AddTeacherIdColumnToKlasses < ActiveRecord::Migration
  def change
    add_column :klasses, :teacher_id, :integer
  end
end
