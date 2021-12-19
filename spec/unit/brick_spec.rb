require 'spec_helper'

describe 'Brick' do
  let(:rows) { 100 }
  let(:cols) { 110 }
  let(:row) { rows / 2 }
  let(:col) { rows / 2 }
  let(:cell_size) { 11 }
  let(:world) { World.new(rows: rows, cols: cols) }

  subject { Brick.new(world, row, col) }

  context 'when placed on the world' do
    it 'must stay at the same place' do
      world.set!(row: rows / 2, col: cols / 2, object: subject)

      object = world.get(row: rows / 2, col: cols / 2)

      expect(object).to be_truthy
      expect(object).to eq subject
    end

    it 'must update!, and do nothing' do
      world.set!(row: rows / 2, col: cols / 2, object: subject)
      object = world.get(row: rows / 2, col: cols / 2)

      object.update!.update!.update!

      expect(object).to be_truthy
      expect(object).to eq subject
    end
  end
end
