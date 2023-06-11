# frozen_string_literal: true

require_relative 'space_fuel/version'

module SpaceFuel
  class Calculator
    def self.call(ship_mass, flight_route)
      new(ship_mass, flight_route).call
    end

    def initialize(ship_mass, flight_route)
      @ship_mass = ship_mass
      @flight_route = flight_route
      @total_fuel = 0
      @additional_fuel = 0
    end

    def call
      calculate_fuel_for_route
      @total_fuel += @additional_fuel
      @total_fuel
    end

    private

    FUEL_STATS = { launch: [0.042, 33], land: [0.033, 42] }.freeze

    def calculate_fuel_for_route
      @flight_route.each do |step|
        directive, gravity = step

        fuel = calculate_fuel(@ship_mass, gravity, directive)
        update_fuel_counters(directive, fuel)
      end
    end

    def calculate_fuel(ship_mass, gravity, directive)
      (ship_mass * gravity * FUEL_STATS[directive][0] - FUEL_STATS[directive][1]).to_i
    end

    def update_fuel_counters(directive, fuel)
      send("update_#{directive}_fuel", fuel)
    end

    def update_launch_fuel(fuel)
      @additional_fuel += fuel
    end

    def update_land_fuel(fuel)
      @total_fuel += fuel
      @additional_fuel -= fuel
      @additional_fuel = 0 if @additional_fuel.negative?
    end
  end
end
