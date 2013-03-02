class ExamPaper < ActiveRecord::Base
  attr_accessible :name
  has_many :question_of_exam_papers
  has_many :question_templates, :through => :question_of_exam_papers

end
