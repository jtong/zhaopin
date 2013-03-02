class CreateExamPapers < ActiveRecord::Migration
  def change
    create_table :exam_papers do |t|
      t.name :string

      t.timestamps
    end
  end
end
