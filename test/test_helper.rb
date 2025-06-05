# test/test_helper.rb
ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require 'simplecov'
SimpleCov.start 'rails'

require "minitest/reporters"
Minitest::Reporters.use! # <--- DIESE ZEILE AUSKOMMENTIEREN

module ActiveSupport
  class TestCase
   # parallelize(workers: :number_of_processors)
    # fixtures :all # <--- Weiterhin auskommentiert lassen
    include FactoryBot::Syntax::Methods
    include Devise::Test::IntegrationHelpers
  end
end