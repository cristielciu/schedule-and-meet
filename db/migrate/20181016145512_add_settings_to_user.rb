class AddSettingsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :facebook_api_key, :string
    add_column :users, :group_id, :string
  end
end
