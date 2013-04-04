class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.string :name
      t.string :url
      t.string :desc

      t.timestamps
    end
  end
end
