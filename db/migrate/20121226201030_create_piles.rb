class CreatePiles < ActiveRecord::Migration
  def change
    create_table :piles do |t|
      t.integer :item_id
      t.integer :Amount
      t.integer :pile_group_id
      
      t.timestamps
    end
  end  
end
