class CreateMyJobRoles < ActiveRecord::Migration
  def change
    create_table :my_job_roles do |t|
      t.string :name
      t.references :user
      t.boolean :is_current

      t.timestamps
    end
    add_index :my_job_roles, :user_id
  end
end
