class CreateQuestionOfExamPapers < ActiveRecord::Migration
  def change
    create_table :question_of_exam_papers do |t|
      t.references :question_template
      t.references :exam_paper

      t.timestamps
    end
    add_index :question_of_exam_papers, :question_template_id
    add_index :question_of_exam_papers, :exam_paper_id
  end
end
