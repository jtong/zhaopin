class MyPostedHomework < ActiveRecord::Base
  belongs_to :homework
  belongs_to :user
  attr_accessible :desc, :url
end
