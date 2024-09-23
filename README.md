# Toy Robot Simulator

This is a simple toy robot simulator that can be placed on a 5x5 grid and moved around the grid. The robot can be placed on the grid, moved, rotated, and report its current position.

## Installation

App is built using Ruby 3.2.1. To install the app, clone the repository and run the following commands:

```
bundle install
```

## Usage

To run the app, run the following command:

```
chmod +x bin/robot_simulator

./bin/robot_simulator
```

## Description

The app will then prompt you to enter commands. The commands are case-insensitive. The robot must be placed on the grid before any other commands can be run. The origin (0,0) can be considered to be the SOUTH WEST most corner of the grid. The first valid command to the robot is a PLACE command. The commands are as follows:

- `PLACE X,Y,F` - Place the robot on the grid at position X,Y facing direction F (NORTH, SOUTH, EAST, WEST)
- `MOVE` - Move the robot one unit in the direction it is facing
- `LEFT` - Rotate the robot 90 degrees to the left
- `RIGHT` - Rotate the robot 90 degrees to the right
- `REPORT` - Report the current position of the robot

The app will ignore any commands that would cause the robot to fall off the grid.

To exit the app, type `exit` and press enter.

## Example Usage

- PLACE 0,0,NORTH
- MOVE
- REPORT
  - Output: 0,1,NORTH
- PLACE 0,0,NORTH
- LEFT
- REPORT
  - Output: 0,0,WEST
- PLACE 1,2,EAST
- MOVE
- MOVE
- LEFT
- MOVE
- REPORT
  - Output: 3,3,NORTH

## Testing

To run the tests, run the following command:

```
bundle exec rspec
```
