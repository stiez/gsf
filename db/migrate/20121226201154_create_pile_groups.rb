class CreatePileGroups < ActiveRecord::Migration
  def change
    create_table :pile_groups do |t|
      t.string :Name
      t.integer :station_id
      
      t.timestamps
    end
  end
end