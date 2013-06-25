class ChangeContentFromMyQuestions < ActiveRecord::Migration
  def up
    change_column(:my_questions, :content, :text)
  end

  def down
    change_column(:my_questions, :content, :string)
  end
end
