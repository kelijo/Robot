
class Robot

	def initialize(name)
		@name = name
	end
	
	def getName()
		return @name
	end
	
	def setCurrentPosition(position)
	
		@currentPosition = position
	end
	
	def getCurrentPosition()
		return @currentPosition
	end
	
	def setTable(table)
		@table = table
	end
	
	
	
	def executeCommand(command)
		
		exeResult = Hash.new
		
		if @currentPosition == nil and command.getInstructions[0].casecmp("PLACE") !=0
			exeResult["returnCode"] = 1
			exeResult["returnComment"] = 'the robot needs to be placed first'
			return exeResult			
		end
		
		#report position
		if command.getInstructions[0].casecmp("REPORT") ==0
			
			exeResult["returnCode"] = 0
			exeResult["returnComment"] =  @currentPosition.positionDetailInString
			return exeResult
			
		end
		
		
		# place command
		if command.getInstructions[0].casecmp("PLACE") ==0
			if @table == nil
				exeResult["returnCode"] = 1
				exeResult["returnComment"] = 'the robot needs to be put on the table first'
				return exeResult
			end
			
			if	command.getInstructions[1].to_i > @table.getWidth-1 or command.getInstructions[2].to_i > @table.getLength-1
				
				exeResult["returnCode"] = 1
				exeResult["returnComment"] = 'the robot cannot be placed over boundary of the table'
				return exeResult
				
			else
	
				position = Position.new(command.getInstructions[1],command.getInstructions[2],command.getInstructions[3])
				setCurrentPosition(position)
				exeResult["returnCode"] = 0
				exeResult["returnComment"] ='Command executed successfully'
				return exeResult
	
			end
		end
		
		# 
		
		if command.getInstructions[0].casecmp("MOVE") == 0 
			# Move one step

			if @currentPosition.getFacing.casecmp("SOUTH") ==0
				return move_south
			
			elsif @currentPosition.getFacing.casecmp("NORTH") ==0
				return move_north
				
			elsif @currentPosition.getFacing.casecmp("WEST") ==0
				return move_west
				
			elsif @currentPosition.getFacing.casecmp("EAST") ==0
				return move_east
				
			end

		end		
				
		
		if command.getInstructions[0].casecmp("LEFT") == 0
			# Turn Left
			turn_left
			exeResult["returnCode"] = 0
			exeResult["returnComment"] ='Command executed successfully'
			return exeResult
		elsif command.getInstructions[0].casecmp("RIGHT") == 0
			# Turn Right
			turn_right
			exeResult["returnCode"] = 0
			exeResult["returnComment"] ='Command executed successfully'
			return exeResult
		end
		
			
	end
	

	
	
	private
	
	def turn_left
		if @currentPosition.getFacing.casecmp("EAST") == 0
			@currentPosition.setFacing("NORTH")
		elsif @currentPosition.getFacing.casecmp("WEST") == 0
			@currentPosition.setFacing("SOUTH")
		elsif @currentPosition.getFacing.casecmp("NORTH") == 0
			@currentPosition.setFacing("WEST")
		elsif @currentPosition.getFacing.casecmp("SOUTH") == 0
			@currentPosition.setFacing("EAST")
		end
	end
	
	def turn_right
		if @currentPosition.getFacing.casecmp("EAST") == 0
			@currentPosition.setFacing("SOUTH")
		elsif @currentPosition.getFacing.casecmp("WEST") == 0
			@currentPosition.setFacing("NORTH")
		elsif @currentPosition.getFacing.casecmp("NORTH") == 0
			@currentPosition.setFacing("EAST")
		elsif @currentPosition.getFacing.casecmp("SOUTH") == 0
			@currentPosition.setFacing("WEST")
		end
	end
	
	def move_north
		exeResult = Hash.new 
		if @currentPosition.getY + 1 < @table.getLength
			@currentPosition.setY(@currentPosition.getY + 1)
			exeResult["returnCode"] = 0
			exeResult["returnComment"] ='Command executed successfully'
			return exeResult
		else
			exeResult["returnCode"] = 1
			exeResult["returnComment"] ='over northern boundary'
			return exeResult
		end
	end
	
	def move_south
		exeResult = Hash.new
		if @currentPosition.getY - 1 > -1
			@currentPosition.setY(@currentPosition.getY - 1)
			
			exeResult["returnCode"] = 0
			exeResult["returnComment"] ='Command executed successfully'
			return exeResult
		else
			exeResult["returnCode"] = 1
			exeResult["returnComment"] ='over southern boundary'
			return exeResult
		end
	end
	
	def move_east
		exeResult = Hash.new
		if @currentPosition.getX + 1 < @table.getWidth
			@currentPosition.setX(@currentPosition.getX + 1)
			exeResult["returnCode"] = 0
			exeResult["returnComment"] ='Command executed successfully'
			return exeResult
		else
			exeResult["returnCode"] = 1
			exeResult["returnComment"] ='over eastern boundary'
			return exeResult
		end
	end
	
	def move_west
		exeResult = Hash.new
		if @currentPosition.getX - 1 > -1
			@currentPosition.setX(@currentPosition.getX - 1)
			exeResult["returnCode"] = 0
			exeResult["returnComment"] ='Command executed successfully'
			return exeResult
		else
			exeResult["returnCode"] = 1
			exeResult["returnComment"] ='over western boundary'
			return exeResult
		end
	end
end