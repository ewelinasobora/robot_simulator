# frozen_string_literal: true

require_relative 'movable_item'
# Represents a robot that can move and face different directions.
class Robot < MovableItem
  # DIRECTIONS = %w[NORTH EAST SOUTH WEST].freeze

  def initialize(x_coordinate: nil, y_coordinate: nil, facing: nil, steps: 1)
    super(x_coordinate:, y_coordinate:, facing:)
    @steps = steps
  end

  def move
    super(@steps)
  end
end
