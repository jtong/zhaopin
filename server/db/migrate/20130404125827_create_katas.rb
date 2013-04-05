class CreateKatas < ActiveRecord::Migration
  def change
    create_table :katas do |t|
      t.string :name
      t.string :url
      t.string :desc
      t.string :language

      t.timestamps
    end
  end
end
