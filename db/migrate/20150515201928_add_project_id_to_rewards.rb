class AddProjectIdToRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :project_id, :string
    add_column :rewards, :integer, :string
  end
end
