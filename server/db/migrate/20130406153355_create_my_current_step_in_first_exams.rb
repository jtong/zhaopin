class CreateMyCurrentStepInFirstExams < ActiveRecord::Migration
  def change
    create_table :my_current_step_in_first_exams do |t|
      t.references :user
      t.string :step
      t.integer :step_num

      t.timestamps
    end
    add_index :my_current_step_in_first_exams, :user_id
  end
end
