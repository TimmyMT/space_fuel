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
    end

    def call
      fuel_by_route
      @total_fuel
    end

    private

    FUEL_STATS = { launch: [0.042, 33], land: [0.033, 42] }.freeze

    def fuel_by_route
      @flight_route.each do |step|
        directive, gravity = step

        calculate_fuel(@ship_mass, gravity, directive)
      end
    end

    def calculate_fuel(ship_mass, gravity, directive)
      init_fuel = formula(ship_mass, gravity, directive)
      last_fuel = 0

      while init_fuel > 40
        @total_fuel += init_fuel if last_fuel != init_fuel
        init_fuel = formula(init_fuel, gravity, directive)
        @total_fuel += init_fuel
        last_fuel = init_fuel
      end
    end

    def formula(ship_mass, gravity, directive)
      (ship_mass * gravity * FUEL_STATS[directive][0] - FUEL_STATS[directive][1]).to_i
    end
  end
end
