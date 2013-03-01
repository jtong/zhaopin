# This migration comes from moode_user_plugin (originally 20130218072955)
class CreateMoodeUserPluginUsers < ActiveRecord::Migration
  def change
    create_table :moode_user_plugin_users do |t|
      t.string :username
      t.string :display_name
      t.string :email
      t.string :password
      t.string :token
      t.integer :phone
      t.boolean :admin, :default => false
      t.timestamps
    end
  end
end
