# frozen_string_literal: true

class Table
  attr_reader :width, :height

  def initialize(width:, height:)
    @width = width
    @height = height
  end

  def position_within_bounds?(x_coordinate, y_coordinate)
    x_coordinate.is_a?(Integer) &&
      y_coordinate.is_a?(Integer) &&
      x_coordinate >= 0 &&
      x_coordinate < width &&
      y_coordinate >= 0 &&
      y_coordinate < height
  end
end
