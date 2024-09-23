# frozen_string_literal: true

class Table
  attr_reader :width, :height

  def initialize(width:, height:)
    @width = width
    @height = height
  end

  def position_within_bounds?(x, y)
    x.is_a?(Integer) && y.is_a?(Integer) && x >= 0 && x < width && y >= 0 && y < height
  end
end
