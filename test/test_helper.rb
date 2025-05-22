ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require 'simplecov'
SimpleCov.start 'rails'

#Mindest Anforderung für Code Coverage festlegen
#SimpleCov.minimum_coverage 90

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    # fixtures :all # <--- Diese Zeile wurde auskommentiert

    # Add more helper methods to be used by all tests here...
  end
end
