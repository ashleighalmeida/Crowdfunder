class ChangeDateType < ActiveRecord::Migration
  def change
    change_column :projects, :start_date, :datetime 
    change_column :projects, :end_date, :datetime 
  end
end
