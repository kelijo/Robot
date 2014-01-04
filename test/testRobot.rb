require 'test/unit'
require '../app/robot.rb'
require '../app/command.rb'
require '../app/table.rb'
require '../app/position.rb'

class TestRobot < Test::Unit::TestCase
	
	def testPlaceRobotWithoutSetTable_returnCode

		robot = Robot.new("TestRobot")
		command = Command.new("Place,1,1,north")
		expected = robot.executeCommand(command)["returnCode"]
		assert_equal expected, 1
	end
	
	def testPlaceRobotWithoutSetTable_displayComment

		robot = Robot.new("TestRobot")
		command = Command.new("Place,1,1,north")
		expected = robot.executeCommand(command)["returnComment"]
		assert_equal expected, "the robot needs to be put on the table first"
	end
	
	def testMoveRobertWithoutPlaceFirst_move_returnCode
		
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Move")
		expected = robot.executeCommand(command)["returnCode"]
		assert_equal expected, 1
	end
	
	def testMoveRobertWithoutPlaceFirst_move_displayComment
		
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Move")
		expected = robot.executeCommand(command)["returnComment"]
		assert_equal expected, "the robot needs to be placed first"
	end
	
	def testMoveRobertWithoutPlaceFirst_left_returnCode
		
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Left")
		expected = robot.executeCommand(command)["returnCode"]
		assert_equal expected, 1
	end
	
	def testMoveRobertWithoutPlaceFirst_left_displayComment
		
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Left")
		expected = robot.executeCommand(command)["returnComment"]
		assert_equal expected, "the robot needs to be placed first"
	end
	
		def testMoveRobertWithoutPlaceFirst_right_returnCode
		
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Right")
		expected = robot.executeCommand(command)["returnCode"]
		assert_equal expected, 1
	end
	
	def testMoveRobertWithoutPlaceFirst_right_displayComment
		
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Right")
		expected = robot.executeCommand(command)["returnComment"]
		assert_equal expected, "the robot needs to be placed first"
	end
	
	def testOverSouthernBoundary_returnCode
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Place,0,0,south")
		robot.executeCommand(command)
		command = Command.new("Move")
		expected = robot.executeCommand(command)["returnCode"]
		assert_equal expected, 1
	end
	
	def testOverSouthernBoundary_displayComment
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Place,0,0,south")
		robot.executeCommand(command)
		command = Command.new("Move")
		expected = robot.executeCommand(command)["returnComment"]
		assert_equal expected, "over southern boundary"
	end
	
	def testOverNorthenBoundary_returnCode
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Place,0,4,north")
		robot.executeCommand(command)
		command = Command.new("Move")
		expected = robot.executeCommand(command)["returnCode"]
		assert_equal expected, 1
	end
	
	def testOverNorthenBoundary_displayComment
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Place,0,4,north")
		robot.executeCommand(command)
		command = Command.new("Move")
		expected = robot.executeCommand(command)["returnComment"]
		assert_equal expected, "over northern boundary"
	
	end
	
	def testOverEasternBoundary_returnCode
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Place,4,2,east")
		robot.executeCommand(command)
		command = Command.new("Move")
		expected = robot.executeCommand(command)["returnCode"]
		assert_equal expected, 1
	end
	
	def testOverEasternBoundary_displayComment
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Place,4,2,east")
		robot.executeCommand(command)
		command = Command.new("Move")
		expected = robot.executeCommand(command)["returnComment"]
		assert_equal expected, "over eastern boundary"
	
	end
	
	def testOverWesternBoundary_returnCode
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Place,0,2,west")
		robot.executeCommand(command)
		command = Command.new("Move")
		expected = robot.executeCommand(command)["returnCode"]
		assert_equal expected, 1
	end
	
	def testOverWesternBoundary_displayComment
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Place,0,2,west")
		robot.executeCommand(command)
		command = Command.new("Move")
		expected = robot.executeCommand(command)["returnComment"]
		assert_equal expected, "over western boundary"
	end
	
	def testTurnLeftFromWest
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Place,0,2,west")
		robot.executeCommand(command)
		command = Command.new("Left")
		robot.executeCommand(command)
		command = Command.new("report")
		expected = robot.executeCommand(command)["returnComment"]
		assert_equal expected, "0,2,SOUTH"
	end
	
	def testTurnLeftFromSouth
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Place,0,2,south")
		robot.executeCommand(command)
		command = Command.new("Left")
		robot.executeCommand(command)
		command = Command.new("report")
		expected = robot.executeCommand(command)["returnComment"]
		assert_equal expected, "0,2,EAST"
	end
	
	def testTurnLeftFromEast
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Place,0,2,east")
		robot.executeCommand(command)
		command = Command.new("Left")
		robot.executeCommand(command)
		command = Command.new("report")
		expected = robot.executeCommand(command)["returnComment"]
		assert_equal expected, "0,2,NORTH"
	end
	
	
	def testTurnLeftFromNorth
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Place,0,2,north")
		robot.executeCommand(command)
		command = Command.new("Left")
		robot.executeCommand(command)
		command = Command.new("report")
		expected = robot.executeCommand(command)["returnComment"]
		assert_equal expected, "0,2,WEST"
	end
	
	
	def testTurnRightFromWest
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Place,0,2,west")
		robot.executeCommand(command)
		command = Command.new("Right")
		robot.executeCommand(command)
		command = Command.new("report")
		expected = robot.executeCommand(command)["returnComment"]
		assert_equal expected, "0,2,NORTH"
	end
	
	def testTurnRightFromEast
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Place,0,2,east")
		robot.executeCommand(command)
		command = Command.new("Right")
		robot.executeCommand(command)
		command = Command.new("report")
		expected = robot.executeCommand(command)["returnComment"]
		assert_equal expected, "0,2,SOUTH"
	end
	
	def testTurnRightFromNorth
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Place,0,2,north")
		robot.executeCommand(command)
		command = Command.new("Right")
		robot.executeCommand(command)
		command = Command.new("report")
		expected = robot.executeCommand(command)["returnComment"]
		assert_equal expected, "0,2,EAST"
	end
	
	def testTurnRightFromSouth
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Place,0,2,south")
		robot.executeCommand(command)
		command = Command.new("Right")
		robot.executeCommand(command)
		command = Command.new("report")
		expected = robot.executeCommand(command)["returnComment"]
		assert_equal expected, "0,2,WEST"
	end
	
	def testYMove
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Place,0,2,south")
		robot.executeCommand(command)
		command = Command.new("Move")
		robot.executeCommand(command)
		command = Command.new("Report")
		expected = robot.executeCommand(command)["returnComment"]
		assert_equal expected, "0,1,SOUTH"
	end
	
	def testXMove
		robot = Robot.new("TestRobot")
		table = Table.new(5,5)
		robot.setTable(table)
		command = Command.new("Place,1,2,west")
		robot.executeCommand(command)
		command = Command.new("Move")
		robot.executeCommand(command)
		command = Command.new("Report")
		expected = robot.executeCommand(command)["returnComment"]
		assert_equal expected, "0,2,WEST"
	end
end