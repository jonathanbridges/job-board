class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :name, null: false
      t.boolean :is_employer, null: false, default: false
      t.integer :company_id
      t.string :password_digest, null:false
      t.string :session_token, null:false
      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :company_id
    add_index :users, :session_token, unique: true
  end
end
