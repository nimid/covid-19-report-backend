ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/spec'
require 'mocha/minitest'

module ActiveSupport
  class TestCase
    fixtures :all
  end
end
