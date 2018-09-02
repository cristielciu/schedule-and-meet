class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :description
      t.datetime :starts_at
      t.references :creator, index: true, foreign_key: { to_table: :users }
    end
  end
end
