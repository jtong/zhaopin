class CreateMyPostedKata < ActiveRecord::Migration
  def change
    create_table :my_posted_katas do |t|
      t.references :kata
      t.references :user
      t.string :url
      t.string :desc

      t.timestamps
    end
    add_index :my_posted_katas, :kata_id
    add_index :my_posted_katas, :user_id
  end
end
