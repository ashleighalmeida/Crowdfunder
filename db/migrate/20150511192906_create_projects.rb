class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :title
      t.string :description
      t.integer :funding_goal
      t.integer :start_date
      t.integer :end_date
      t.string :photo_url
      t.integer :total_raised
      t.string :category


      t.timestamps null: false
    end
  end
end
