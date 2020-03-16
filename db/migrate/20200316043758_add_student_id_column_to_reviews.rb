class AddStudentIdColumnToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :student_id, :integer
  end
end
