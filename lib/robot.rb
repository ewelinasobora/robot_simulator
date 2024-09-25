# frozen_string_literal: true

class Robot
  DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  attr_accessor :x_coordinate, :y_coordinate, :facing

  def initialize(x_coordinate: nil, y_coordinate: nil, facing: nil)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @facing = facing
  end

  def place(x_coordnate, y_coordnate, facing)
    return unless DIRECTIONS.include?(facing)

    @x_coordinate = x_coordnate
    @y_coordinate = y_coordnate
    @facing = facing
  end

  def move
    case @facing
    when 'NORTH'
      @y_coordinate += 1
    when 'EAST'
      @x_coordinate += 1
    when 'SOUTH'
      @y_coordinate -= 1
    when 'WEST'
      @x_coordinate -= 1
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
