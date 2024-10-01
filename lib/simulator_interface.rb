# frozen_string_literal: true

require_relative '../errors/error_messages'
require_relative '../errors/error_handler'

# SimulatorInterface handles the interaction with the user and processes commands for the robot simulator.
class SimulatorInterface
  include ErrorHandler

  COMMANDS = {
    # regex to match the PLACE command and capture the x, y, and direction values
    'PLACE' => /^PLACE\s+(\d+)\s*,\s*(\d+)\s*,\s*(NORTH|SOUTH|EAST|WEST)$/,
    'MOVE' => 'MOVE',
    'LEFT' => 'LEFT',
    'RIGHT' => 'RIGHT',
    'REPORT' => 'REPORT',
    'EXIT' => 'EXIT'
  }.freeze

  def initialize(simulator)
    @simulator = simulator
  end

  def start
    print_instructions

    loop do
      input = gets.chomp.upcase
      process_command(input)
    end
  end

  private

  def print_instructions
    puts 'PLACE X,Y,F - to place the robot on the table at position X,Y facing direction F ' \
         '(NORTH, EAST, SOUTH, or WEST).'
    puts 'Commands are case-insensitive.'
    puts 'MOVE - to move the robot one step forward in the direction it is currently facing.'
    puts 'LEFT - to rotate the robot 90 degrees to the left.'
    puts 'RIGHT - to rotate the robot 90 degrees to the right.'
    puts 'REPORT - to display the current position and direction of the robot.'
    puts 'EXIT - to exit the simulator.'
  end

  def process_command(input)
    if input.match?(COMMANDS['PLACE'])
      process_place_command(input)
    elsif COMMANDS.values.include?(input)
      process_simple_command(input)
    else
      puts 'Invalid command! Please use one of the following commands:'
      print_instructions
    end
  end

  def process_place_command(input)
    x, y, direction = input.match(COMMANDS['PLACE']).captures
    handle_errors { @simulator.place_movable_item(x.to_i, y.to_i, direction) }
  end

  def process_simple_command(input)
    command_handlers = {
      COMMANDS['MOVE'] => method(:handle_move),
      COMMANDS['LEFT'] => method(:handle_left),
      COMMANDS['RIGHT'] => method(:handle_right),
      COMMANDS['REPORT'] => method(:handle_report),
      COMMANDS['EXIT'] => method(:handle_exit)
    }

    handler = command_handlers[input]
    handler&.call
  end

  def handle_move
    handle_errors { @simulator.move_movable_item }
  end

  def handle_left
    handle_errors { @simulator.rotate_movable_item('LEFT') }
  end

  def handle_right
    handle_errors { @simulator.rotate_movable_item('RIGHT') }
  end

  def handle_report
    handle_errors { puts @simulator.report }
  end

  def handle_exit
    exit
  end
end
