class KlassesStudents < ActiveRecord::Migration
  def change
    create_table :klasses_students do |t|
      t.integer :klass_id
      t.integer :student_id
    end
  end
end
