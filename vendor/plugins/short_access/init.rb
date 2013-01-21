# Include hook code here
require "short_access"
ActiveRecord::Base.send(:include, ShortAccess)
