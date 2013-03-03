class CreateMyExams < ActiveRecord::Migration
  def change
    create_table :my_exams do |t|
      t.integer :user_id
      t.float :score
      t.integer :time_cost

      t.timestamps
    end
  end
end
