class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.integer :applicant_id, null: false
      t.integer :opening_id, null: false
      t.timestamps
    end
    add_index :applications, :applicant_id
    add_index :applications, :opening_id
  end
end
