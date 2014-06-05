class MyQuestion < ActiveRecord::Base
  belongs_to :my_exam
  attr_accessible :answer, :content, :name, :user_post, :answer_verify_type

  def right?
    if answer_verify_type == "multi_contains"
      multi_contains
    elsif answer_verify_type == "contains"
      contains
    else
      user_post == answer
    end
  end
  private
  def contains
    p answer
    answer_obj = JSON.parse(answer)
    user_post_obj = JSON.parse(user_post)
    if user_post_obj.nil? || user_post_obj.length != answer_obj.length
      return false
    end
    user_post_obj.each do |item|
      if not answer_obj.include? item
        return false
      end
    end
    true
  end

  def multi_contains
    answer_obj = JSON.parse(answer)
    user_post_obj = JSON.parse(user_post)

    result = true
    answer_obj.each do |k, v|
      if user_post_obj[k].nil? || user_post_obj[k].length != answer_obj[k].length
        result = false
        break
      end
      user_post_obj[k].each do |item|
        if not answer_obj[k].include? item
          result = false
          break
        end
      end
    end
    result
  end
end
