# world_spec.rb

require 'spec_helper'

describe 'The World' do
  let(:rows) { 100 }
  let(:cols) { 110 }
  let(:cell_size) { 11 }
  subject { World.new(rows: rows, cols: cols, cell_size: cell_size) }

  context 'when it is empty' do
    it 'should have 100 rows' do
      expect(subject.rows).to eq rows
    end

    it 'should have 110 cols' do
      expect(subject.cols).to eq cols
    end

    it 'should have a 11 cell_size' do
      expect(subject.cell_size).to eq cell_size
    end

    it 'has all internal cells empty' do
      0.upto(subject.rows - 1) do |row|
        0.upto(subject.cols - 1) do |col|
          expect(subject.empty?(row, col)).to be true
        end
      end
    end
  end

  context 'when checking the boundaries' do
    it 'negative rows or cols are out of boundaries' do
      expect(subject.out_of_boundaries?(-1, 0)).to be true
      expect(subject.out_of_boundaries?(0, -1)).to be true
    end

    it 'rows and beyond are is out of boundaries' do
      expect(subject.out_of_boundaries?(rows, 0)).to be true
    end

    it 'cols and beyond are is out of boundaries' do
      expect(subject.out_of_boundaries?(0, cols)).to be true
    end
  end

  context 'adding an object occupies a cell' do
    let(:row) { subject.rows - 1 }
    let(:col) { subject.cols - 1 }
    let(:object) { 'x' }
    before { subject.set!(row, col, object) }

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

  context 'adding objects' do
    it 'on an empty cell' do
      expect(subject.set!(rand(subject.rows), rand(subject.cols), 'x')).to be true
    end
  end

  context 'can move an object to an empty cell' do
    let(:row) { subject.rows / 2 }
    let(:col) { subject.cols / 2 }
    let(:object) { 'x' }

    [[-1, 0], [1, 0], [0, -1], [0, 1]].each do |m|
      it "can move from location to #{m}" do
        subject.set!(row, col, object)
        movement_result = subject.move!(row, col, row + m[0], col + m[1])

        expect(movement_result).to be true
        expect(subject.empty?(row, col)).to be true
        expect(subject.empty?(row + m[0], col + m[1])).to be false
        expect(subject.get(row + m[0], col + m[1])).to be object
      end
    end
  end
end
