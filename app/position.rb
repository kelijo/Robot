class Position
	def initialize(x,y,facing)
		@x = x.to_i
		@y = y.to_i
		@facing = facing.upcase
	end
	
	def setX(x)
		@x = x.to_i
	end
	
	def setY(y)
		@y = y.to_i
	end
	
	def getX
		return @x
	end
	
	def getY
		return @y
	end
	
	def setFacing(direction)
		if direction.casecmp("NORTH")==0 or direction.casecmp("SOUTH")==0 or direction.casecmp("WEST")==0 or direction.casecmp("EAST")==0		
			@facing = direction		
		end
	end
	
	def getFacing
		
		return @facing
	end
	
	def positionDetailInString
		return "#{@x},#{@y},#{@facing}"
	end
end
