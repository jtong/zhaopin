class AddAnswerVerifyTypeToMyQuestion < ActiveRecord::Migration
  def change
    add_column :my_questions, :answer_verify_type, :string
  end
end
