# SpaceFuel

Space Fuel is a Ruby gem for calculating the required fuel for space flights.

## Installation

You can install the gem by executing the following command:

    $ gem install space_fuel

Or add the following line to your project's Gemfile:

    $ gem 'space_fuel'

Then run the bundle install command.

## Usage

```
require 'space_fuel'

ship_mass = 28801
flight_route = [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]]

fuel = SpaceFuel::Calculator.call(ship_mass, flight_route)
puts "Required fuel: #{fuel} kg"
```

## Description

This gem provides a simple and reliable way to calculate the required fuel for space flights based on the flight route and ship mass. It uses predefined values for the calculation based on the action (launch or land) and the gravitational force of the planet.

## Testing
You can run tests using the command

    $ rspec

