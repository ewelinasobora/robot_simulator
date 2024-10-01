# frozen_string_literal: true

require_relative '../errors/error_messages'
require_relative '../errors/error_handler'

# Simulator class is responsible for controlling the movements of a movable item on a table.
class Simulator
  include ErrorHandler

  attr_reader :table, :movable_item

  def initialize(table:, movable_item:)
    @table = table
    @movable_item = movable_item
  end

  def place_movable_item(x_position, y_position, direction)
    handle_errors do
      unless table.position_within_bounds?(x_position, y_position)
        raise Errors::InvalidPositionError.new(x_position, y_position)
      end

      raise Errors::InvalidDirectionError, direction unless movable_item.class::DIRECTIONS.include?(direction)

      movable_item.place(x_position, y_position, direction)
    end
  end

  def move_movable_item
    handle_errors do
      raise Errors.movable_itemNotPlacedError unless placed?

      new_x, new_y = next_position

      raise Errors::MoveIgnoredError unless table.position_within_bounds?(new_x, new_y)

      movable_item.move
    end
  end

  def rotate_movable_item(direction)
    handle_errors do
      raise Errors.movable_itemNotPlacedError unless placed?

      movable_item.rotate(direction)
    end
  end

  def report
    handle_errors do
      raise Errors.movable_itemNotPlacedError unless placed?

      "#{movable_item.x_coordinate},#{movable_item.y_coordinate},#{movable_item.facing}"
    end
  end

  private

  def next_position
    x = movable_item.x_coordinate
    y = movable_item.y_coordinate
    x, y = adjust_position(x, y, movable_item.facing)
    [x, y]
  end

  def adjust_position(x_coord, y_coord, facing)
    case facing
    when 'NORTH'
      y_coord += 1
    when 'EAST'
      x_coord += 1
    when 'SOUTH'
      y_coord -= 1
    when 'WEST'
      x_coord -= 1
    end
    [x_coord, y_coord]
  end

  def placed?
    movable_item.x_coordinate && movable_item.y_coordinate && movable_item.facing
  end
end
