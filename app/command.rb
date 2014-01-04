class Command

 def initialize(commandString)
	@commandString = commandString
	@instructions = commandString.split(",")
 end
 
 def isCommandValid
	
	isValid = false
	if @commandString.casecmp("MOVE")==0 or @commandString.casecmp("RIGHT")==0 or @commandString.casecmp("LEFT")==0 or @commandString.casecmp("REPORT")==0
		isValid = true
	end
	
	if @commandString.start_with?('PLACE') or @commandString.start_with?('place') or @commandString.start_with?('Place') or @commandString.start_with?('PLacE') or @commandString.start_with?('PLAcE')
		
		if @instructions.length ==4		
			if(@instructions[0].casecmp('PLACE')==0)
				if integer? @instructions[1]
					if integer? @instructions[2]
						if @instructions[3].casecmp('NORTH')==0 or @instructions[3].casecmp('SOUTH')==0 or @instructions[3].casecmp('WEST')==0 or @instructions[3].casecmp('EAST')==0
							isValid = true
						end
						
					end
				end
			end
		
		end
	
	end
	
	return isValid
 end

 def getInstructions 
	return @instructions
 end
 
private 
 def integer?(str)
  /\A[+-]?\d+\z/ === str
end

end