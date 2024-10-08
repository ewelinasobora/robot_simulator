# frozen_string_literal: true

module ErrorHandler

  def handle_errors
    yield
  rescue Errors::InvalidPositionError, Errors::InvalidDirectionError, Errors::MoveIgnoredError, Errors::RobotNotPlacedError, Errors::NotImplementedError => e
    puts e.message
  end
end
