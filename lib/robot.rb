class Robot
  attr_accessor :x, :y, :facing

  def initialize(x_coordinate: nil, y_coordinate: nil, facing: nil)
    @x = x_coordinate
    @y = y_coordinate
    @facing = facing
  end
end
