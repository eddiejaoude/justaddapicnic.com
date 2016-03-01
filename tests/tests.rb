require_relative '../destinations.rb'
require 'test-unit'


class TestBeach < Test::Unit::TestCase
	def setup
		#@testBeach = Beaches.new
	end

	def test_destination_render_no_data
		validate = File.read("./test-data/JAAP_Destination.validator.html")
		assert_equal(validate,Destination.render())
	end

	def test_beach_render_no_data
		validate = File.read("./test-data/beach-empty.validator.html")
		assert_equal(validate,Beaches.render())
	end

	def test_beach_render_from_data
		testBeach = Beaches.new
		testBeach.loadJSONData("./test-data/beach-test1.json")
		validate = File.read("./test-data/beach-test1.validator.html")
		assert_equal(validate,testBeach.render())
	end
end



