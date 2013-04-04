class MyPostedKata < ActiveRecord::Base
  belongs_to :kata
  belongs_to :user, class_name: "MoodeUserPlugin::User"
  attr_accessible :desc, :url
end
