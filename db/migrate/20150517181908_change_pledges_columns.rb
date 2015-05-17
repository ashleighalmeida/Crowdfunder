class ChangePledgesColumns < ActiveRecord::Migration
  def change
    add_column :pledges, :backer_id, :integer
    remove_column :pledges, :user_id, :integer
  end
end
