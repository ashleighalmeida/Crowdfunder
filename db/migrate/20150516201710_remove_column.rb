class RemoveColumn < ActiveRecord::Migration
  def change
        remove_column :rewards, :project_id
  end
end
