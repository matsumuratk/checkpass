class Contact < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name,:email,:content
end
