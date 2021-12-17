# frozen_string_literal: true

require 'spec_helper'

describe 'Creatures' do
  let(:row) { 5 }
  let(:col) { 5 }
  let(:world) { World.new(rows: 2 * row, cols: 2 * col) }

  context 'the creature is in he world' do
    subject { Creature.new() }

    it 'must retrieve the creature correctly' do
      world.set!(row, col, subject)
      expect(world.get(row, col)).to eq subject
    end

    it 'must be a newborn if it just started' do
      expect(subject.age).to eq 0
    end
  end

  context 'the creature grows' do
    subject { Creature.new() }

    it 'After 3 cycles it must be 3 in age' do
      subject.update!(world: world)
             .update!(world: world)
             .update!(world: world)
      expect(subject.age).to eq 3
    end
  end
end
