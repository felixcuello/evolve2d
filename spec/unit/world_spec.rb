# world_spec.rb

require 'spec_helper'

describe 'The World' do
  context 'when it is empty' do
    subject { World.new(100, 110) }

    it 'should have 100 rows' do
      expect(subject.rows).to eq 100
    end

    it 'should have 100 cols' do
      expect(subject.cols).to eq 110
    end

    it 'has all internal cells empty' do
      0.upto(subject.rows - 1) do |row|
        0.upto(subject.cols - 1) do |col|
          expect(subject.empty?(row, col)).to be true
        end
      end
    end

    context 'adding an object occupies a cell' do
      let(:row) { subject.rows - 1 }
      let(:col) { subject.cols - 1 }
      let(:object) { 'x' }
      before { subject.add(row, col, object) }

      it 'used cell is not empty' do
        expect(subject.empty?(row, col)).to be false
      end

      it 'used cell is occupied' do
        expect(subject.occuppied?(row, col)).to be true
      end

      it 'returns the object given the coordinates' do
        expect(subject.get(row, col)).to eq object
      end
    end

    it 'can add an object on an empty cell' do
      expect(subject.add(rand(subject.rows), rand(subject.cols), 'x')).to be true
    end

    context 'can move an object to an empty cell' do
      let(:row) { subject.rows / 2 }
      let(:col) { subject.cols / 2 }
      let(:object) { 'x' }

      it 'can move up' do
        subject.add(row, col, object)
        movement_result = subject.move(row, col, row - 1, col)

        expect(movement_result).to be true
        expect(subject.empty?(row, col)).to be true
        expect(subject.empty?(row - 1, col)).to be false
        expect(subject.get(row - 1, col)).to be object
      end

      it 'can move down' do
        subject.add(row, col, object)
        movement_result = subject.move(row, col, row + 1, col)

        expect(movement_result).to be true
        expect(subject.empty?(row, col)).to be true
        expect(subject.empty?(row + 1, col)).to be false
        expect(subject.get(row + 1, col)).to be object
      end

      it 'can move left' do
        subject.add(row, col, object)
        movement_result = subject.move(row, col, row, col - 1)

        expect(movement_result).to be true
        expect(subject.empty?(row, col)).to be true
        expect(subject.empty?(row, col - 1)).to be false
        expect(subject.get(row, col - 1)).to be object
      end

      it 'can move right' do
        subject.add(row, col, object)
        movement_result = subject.move(row, col, row, col + 1)

        expect(movement_result).to be true
        expect(subject.empty?(row, col)).to be true
        expect(subject.empty?(row, col + 1)).to be false
        expect(subject.get(row, col + 1)).to be object
      end
    end
  end
end
