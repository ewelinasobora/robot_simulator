# frozen_string_literal: true

require_relative '../errors/error_messages' # Ensure this line is added to include the Errors module
class SimulatorInterface
  COMMANDS = {
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
    puts 'PLACE X,Y,F - to place the robot on the table at position X,Y facing direction F (NORTH, EAST, SOUTH, or WEST). Commands are case-insensitive.'
    puts 'MOVE - to move the robot one step forward in the direction it is currently facing.'
    puts 'LEFT - to rotate the robot 90 degrees to the left.'
    puts 'RIGHT - to rotate the robot 90 degrees to the right.'
    puts 'REPORT - to display the current position and direction of the robot.'
    puts 'EXIT - to exit the simulator.'
  end

  def process_command(input)
    case input
    when COMMANDS['PLACE']
      x, y, direction = Regexp.last_match.captures
      begin
        @simulator.place_robot(x.to_i, y.to_i, direction)
      rescue Errors::InvalidPositionError => e
        puts "Error: #{e.message}"
      rescue Errors::InvalidDirectionError => e
        puts "Error: #{e.message}"
      end
    when COMMANDS['MOVE']
      begin
        @simulator.move_robot
      rescue Errors::MoveIgnoredError => e
        puts "Error: #{e.message}"
      end
    when COMMANDS['LEFT']
      @simulator.rotate_robot('LEFT')
    when COMMANDS['RIGHT']
      @simulator.rotate_robot('RIGHT')
    when COMMANDS['REPORT']
      puts @simulator.report
    when COMMANDS['EXIT']
      exit
    else
      puts 'Invalid command! Please use one of the following commands:'
      print_instructions
    end
  end
end