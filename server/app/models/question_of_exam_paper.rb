class QuestionOfExamPaper < ActiveRecord::Base
  belongs_to :question_template
  belongs_to :exam_paper
  # attr_accessible :title, :body
end
