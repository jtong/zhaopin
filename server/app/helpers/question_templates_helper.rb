module QuestionTemplatesHelper
  def question_template_content(question_template)
    custom_render(question_template.view_content(), {:content => question_template.render()[:content]})
  end
end
