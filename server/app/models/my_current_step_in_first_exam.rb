class MyCurrentStepInFirstExam < ActiveRecord::Base
  belongs_to :user, class_name: "MoodeUserPlugin::User"
  attr_accessible :step, :step_num
end
