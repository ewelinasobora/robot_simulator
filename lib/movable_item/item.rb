# frozen_string_literal: true
require_relative 'movable_item'

class Item < MovableItem
  attr_accessor :steps

  def initialize(x_coordinate: nil, y_coordinate: nil, facing: nil, steps: 3)
    super(x_coordinate: x_coordinate, y_coordinate: y_coordinate, facing: facing)
    @steps = steps
  end

  def move
    super(steps)
  end

  
end
