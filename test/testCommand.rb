require 'test/unit'
require '../app/command.rb'

class TestCommandValidation < Test::Unit::TestCase
	
	def testUndefinedCommand
		command = Command.new("Test")
		command.isCommandValid
		expected = command.isCommandValid
    	assert_equal expected, false
	end
	
	def testPlaceCommandWrongFormat
		command = Command.new("Place,1,1,1,1,1,ee")
		command.isCommandValid
		expected = command.isCommandValid
    	assert_equal expected, false
	end
	
	def testPlaceCommandCorrectFormat
		command = Command.new("Place,1,1,north")
		command.isCommandValid
		expected = command.isCommandValid
    	assert_equal expected, true
	end
	
	def testLeftCommandWrongFormat
		command = Command.new("Left,1,1,north")
		command.isCommandValid
		expected = command.isCommandValid
    	assert_equal expected, false
	end
	
	def testLeftCommandCorrectFormat
		command = Command.new("Left")
		command.isCommandValid
		expected = command.isCommandValid
    	assert_equal expected, true
	end
	
	def testRightCommandWrongFormat
		command = Command.new("Right,1,1,north")
		command.isCommandValid
		expected = command.isCommandValid
    	assert_equal expected, false
	end
	
	def testRightCommandCorrectFormat
		command = Command.new("Right")
		command.isCommandValid
		expected = command.isCommandValid
    	assert_equal expected, true
	end
	
	def testMoveCommandWrongFormat
		command = Command.new("Move,1,1,north")
		command.isCommandValid
		expected = command.isCommandValid
    	assert_equal expected, false
	end
	
	def testMoveCommandCorrectFormat
		command = Command.new("Move")
		command.isCommandValid
		expected = command.isCommandValid
    	assert_equal expected, true
	end
end