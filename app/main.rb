
require './table.rb'
require './command.rb'
require './table.rb'
require './position.rb'
require './robot.rb'


#Main
runApplication = 'y'

puts "Please name the Robot"
STDOUT.flush
robotName = gets.chomp
robot = Robot.new(robotName)

table = Table.new(5,5)
robot.setTable(table)

puts "Please input command to move Robot #{robot.getName} (Type 'q' to quit the application)"  
while runApplication == 'y'
	STDOUT.flush  
	
	commandString = gets.chomp 

	if commandString.casecmp('q') ==0 			
		runApplication = 'n'
	else
		command = Command.new(commandString)
		if command.isCommandValid 
			executeResult = robot.executeCommand(command)
			if executeResult.has_key? "returnCode" and executeResult["returnCode"]==1 and executeResult.has_key? "returnComment"
				puts "Robot #{robot.getName} fail to execute command #{commandString} because #{executeResult["returnComment"]}"
			elsif executeResult.has_key? "returnCode" and executeResult["returnCode"]==0 and executeResult.has_key? "returnComment" and executeResult["returnComment"].casecmp("Command executed successfully")!=0
				puts "#{executeResult["returnComment"]}"
			end
		else
			puts "The command you entered is not valid"
		end
	end
	
end