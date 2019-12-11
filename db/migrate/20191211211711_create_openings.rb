class CreateOpenings < ActiveRecord::Migration[5.2]
  def change
    create_table :openings do |t|
      t.integer :company_id, null: false
      t.string :title, null:false
      t.string :description, null:false
      t.timestamps
    end
    add_index :openings, :company_id
  end
end
