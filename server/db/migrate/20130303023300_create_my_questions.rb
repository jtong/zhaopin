class CreateMyQuestions < ActiveRecord::Migration
  def change
    create_table :my_questions do |t|
      t.references :my_exam
      t.string :name
      t.string :content
      t.string :answer
      t.string :user_post

      t.timestamps
    end
    add_index :my_questions, :my_exam_id
  end
end
