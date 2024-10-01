# frozen_string_literal: true

# MovableItem is a parent class for items that can move in a 2D plane.
# It provides basic functionalities like placing, moving, and rotating.
class MovableItem
  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  attr_accessor :x_coordinate, :y_coordinate, :facing

  def initialize(x_coordinate: nil, y_coordinate: nil, facing: nil, steps: 1)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @facing = facing
    @steps = steps
  end


  def place(x_coordnate, y_coordnate, facing)
    return unless DIRECTIONS.include?(facing)

    @x_coordinate = x_coordnate
    @y_coordinate = y_coordnate
    @facing = facing
  end

  def move(steps)
    case @facing
    when 'NORTH'
      @y_coordinate += steps
    when 'EAST'
      @x_coordinate += steps
    when 'SOUTH'
      @y_coordinate -= steps
    when 'WEST'
      @x_coordinate -= steps
    end
  end

  def rotate(direction)
    return unless %w[LEFT RIGHT].include?(direction)

    current_index = DIRECTIONS.index(@facing)
    if direction == 'LEFT'
      @facing = DIRECTIONS[(current_index - 1) % DIRECTIONS.size]
    elsif direction == 'RIGHT'
      @facing = DIRECTIONS[(current_index + 1) % DIRECTIONS.size]
    end
  end
end
