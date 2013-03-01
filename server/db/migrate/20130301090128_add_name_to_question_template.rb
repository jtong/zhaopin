class AddNameToQuestionTemplate < ActiveRecord::Migration
  def change
    add_column :question_templates, :name, :string
  end
end
