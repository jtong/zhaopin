# This migration comes from moode_user_plugin (originally 20130225054003)
class CreateMoodeUserPluginVerifyCodes < ActiveRecord::Migration
  def change
    create_table :moode_user_plugin_verify_codes do |t|
      t.string :code
      t.string :phone
      t.timestamps
    end
  end
end
