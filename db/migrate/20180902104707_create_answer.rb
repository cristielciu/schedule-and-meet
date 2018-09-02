class CreateAnswer < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.boolean :attempting, default: true
      t.string :user_name, default: ''
      t.integer :guests, default: 0
      t.string :user_ip, default: ''
      t.references :appointment, index: true
    end

    add_index :answers, [:user_ip, :appointment_id], unique: true
  end
end
