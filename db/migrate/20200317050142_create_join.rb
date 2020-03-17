class CreateJoin < ActiveRecord::Migration
  def change
    create_table :klasses_students do |x|
      x.integer :student_id
      x.integer :klass_id
    end
  end
end
