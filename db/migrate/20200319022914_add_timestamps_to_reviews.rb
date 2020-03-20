class AddTimestampsToReviews < ActiveRecord::Migration
  def change
    change_table :reviews do |t|
      t.timestamps :nil => false
    end
    
  end
end

