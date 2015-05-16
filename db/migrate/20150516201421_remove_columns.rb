class RemoveColumns < ActiveRecord::Migration
  def change
    remove_column :rewards, :integer, :project_id
  end
end
