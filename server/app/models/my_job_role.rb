class MyJobRole < ActiveRecord::Base
  belongs_to :user, class_name: "MoodeUserPlugin::User"
  attr_accessible :is_current, :name
end
