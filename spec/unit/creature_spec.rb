# frozen_string_literal: true

require 'spec_helper'

describe 'Creature' do
  let(:row) { 5 }
  let(:col) { 5 }
  let(:world) { World.new(rows: 2 * row, cols: 2 * col) }

  context 'is in he world' do
    subject { Creature.new(row: row, col: col) }

    it 'must retrieve the creature correctly' do
      world.set!(row: row, col: col, object: subject)
      expect(world.get(row: row, col: col)).to eq subject
    end

    it 'must be a newborn if it just started' do
      expect(subject.age).to eq 0
    end
  end

  context 'without neuron conections' do
    subject { Creature.new(row: row, col: col) }

    it 'After 3 cycles it must be 3 in age' do
      subject.update!.update!.update!

      expect(subject.age).to eq 3
    end

    it 'After 3 cycles it must stay at the same position' do
      subject.update!.update!.update!

      expect(subject.row).to eq row
      expect(subject.col).to eq col
    end
  end
end
