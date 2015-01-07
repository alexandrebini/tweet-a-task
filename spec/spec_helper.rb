ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require 'minitest/reporters'

class Minitest::Spec
  include FactoryGirl::Syntax::Methods
  Minitest::Reporters.use!
  FactoryGirl.find_definitions
  FactoryGirl.lint
end