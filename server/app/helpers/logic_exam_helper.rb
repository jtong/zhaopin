module LogicExamHelper
  include HamlHelper

  def page_content_for(question)
    view_tempalte = QuestionTemplate.find_page_template_by_name(question.name)
    cumstom_render view_tempalte, :content => question.content
  end

  def record_begin_time
    session[:start_time] = Time.now
  end

  def start_time
    session[:start_time]
  end

  def record_total_seconds(seconds)
    session[:total_seconds] = seconds
  end

  def total_seconds
    session[:total_seconds]
  end
end
