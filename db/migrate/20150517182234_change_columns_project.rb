class ChangeColumnsProject < ActiveRecord::Migration
  def change
    add_column :projects, :founder_id, :integer
    remove_column :projects, :user_id, :integer
  end
end
