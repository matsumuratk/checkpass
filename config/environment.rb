# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Checkpass::Application.initialize!

#incompatible character対策
require 'encoding_patch'
