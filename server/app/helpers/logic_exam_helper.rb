module LogicExamHelper
  include HamlHelper

  def page_content_for(question)
    view_tempalte = QuestionTemplate.find_page_template_by_name(question.name)
    cumstom_render view_tempalte, :content => question.content
  end
end
