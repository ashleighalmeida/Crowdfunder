class AddForeignKeysToPledges < ActiveRecord::Migration
  def change
    ["user_id", "reward_id", "project_id"].each do |name|
      add_column :pledges, name, :integer
    end 
  end
end
