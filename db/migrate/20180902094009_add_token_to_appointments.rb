class AddTokenToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :url_token, :string
    add_index :appointments, :url_token, unique: true
  end
end
