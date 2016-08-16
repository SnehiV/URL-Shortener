class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.string :short_id

      t.timestamps null: false
    end
    add_index :visits, [:short_id, :user_id] 
  end
end
