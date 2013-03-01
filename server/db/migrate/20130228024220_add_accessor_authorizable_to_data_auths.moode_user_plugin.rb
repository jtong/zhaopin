# This migration comes from moode_user_plugin (originally 20130226100631)
class AddAccessorAuthorizableToDataAuths < ActiveRecord::Migration
  def up
    change_table :moode_user_plugin_data_auths do |t|
      t.references :accessor_authorizable, :polymorphic => true
    end
  end

  def down
    remove_column :moode_user_plugin_data_auths, :accessor_authorizable_id
    remove_column :moode_user_plugin_data_auths, :accessor_authorizable_type
  end
end
