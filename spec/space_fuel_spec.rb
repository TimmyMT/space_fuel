require 'rspec'
require_relative '../lib/space_fuel'

RSpec.describe SpaceFuel::Calculator do
  describe '.call' do
    shared_examples 'calculates the fuel required correctly' do
      it 'calculates the fuel required correctly' do
        fuel = SpaceFuel::Calculator.call(ship_mass, flight_route)
        expect(fuel).to eq(expected_fuel)
      end
    end

    context 'with Apollo 11 mission' do
      let(:ship_mass) { 28801 }
      let(:flight_route) { [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 9.807]] }
      let(:expected_fuel) { 13755 }

      include_examples 'calculates the fuel required correctly'
    end

    context 'with Mission on Mars' do
      let(:ship_mass) { 14606 }
      let(:flight_route) { [[:launch, 9.807], [:land, 3.711], [:launch, 3.711], [:land, 9.807]] }
      let(:expected_fuel) { 8226 }

      include_examples 'calculates the fuel required correctly'
    end

    context 'with Passenger ship' do
      let(:ship_mass) { 75432 }
      let(:flight_route) { [[:launch, 9.807], [:land, 1.62], [:launch, 1.62], [:land, 3.711], [:launch, 3.711], [:land, 9.807]] }
      let(:expected_fuel) { 47858 }

      include_examples 'calculates the fuel required correctly'
    end
  end
end
