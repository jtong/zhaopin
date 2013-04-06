class MyPostedHomework < ActiveRecord::Base
  belongs_to :homework
  belongs_to :user, class_name: "MoodeUserPlugin::User"
  attr_accessible :user, :homework, :desc, :url
end
