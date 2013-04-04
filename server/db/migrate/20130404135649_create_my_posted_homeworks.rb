class CreateMyPostedHomeworks < ActiveRecord::Migration
  def change
    create_table :my_posted_homeworks do |t|
      t.references :homework
      t.string :url
      t.text :desc
      t.references :user

      t.timestamps
    end
    add_index :my_posted_homeworks, :homework_id
    add_index :my_posted_homeworks, :user_id
  end
end
