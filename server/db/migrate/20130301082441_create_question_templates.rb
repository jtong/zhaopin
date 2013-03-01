class CreateQuestionTemplates < ActiveRecord::Migration
  def change
    create_table :question_templates do |t|
      t.string :js_file
      t.string :template_file
      t.string :view_file

      t.timestamps
    end
  end
end
