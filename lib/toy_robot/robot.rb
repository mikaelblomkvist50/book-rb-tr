module ToyRobot
  class Robot
    # attr_reader :east
    attr_reader :north, :direction

    def initialize(east = 0, north = 0, direction = "NORTH")
      @east = east
      @north = north
      @direction = direction
    end

    def east
      @east
    end

    def move_east
      @east+= 1
    end

    def move_west
      @east -= 1
    end

    def move_north
      @north += 1
    end

    def move_south
      @north -= 1
    end

    # Genius
    # def move
    #   send("move_#{@direction.downcase}")
    # end

    # Better for my brain
    def move
      case @direction
        when "NORTH" then move_north
        when "SOUTH" then move_south
        when "EAST"  then move_east
        when "WEST"  then move_west
      end
    end

    def turn_left
      @direction = case @direction
                     when "NORTH" then "WEST"
                     when "SOUTH" then "EAST"
                     when "EAST" then "NORTH"
                     when "WEST" then "SOUTH"
                   end
    end

  end
end
