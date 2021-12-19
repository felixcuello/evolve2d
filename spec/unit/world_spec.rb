# frozen_string_literal: true
# world_spec.rb

require 'spec_helper'

describe 'The World' do
  let(:rows) { 100 }
  let(:cols) { 110 }
  let(:object_size) { 11 }
  subject { World.new(rows: rows, cols: cols, object_size: object_size) }

  context 'when it is empty' do
    it 'should have 100 rows' do
      expect(subject.rows).to eq rows
    end

    it 'should have 110 cols' do
      expect(subject.cols).to eq cols
    end

    it 'should have a 11 object_size' do
      expect(subject.object_size).to eq object_size
    end

    it 'has all internal objects empty' do
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

  context 'adding an object occupies a place' do
    let(:row) { subject.rows - 1 }
    let(:col) { subject.cols - 1 }
    let(:object) { Brick.new(subject, row, col) }
    before { subject.set!(row: row, col: col, object: object) }

    it 'used object is not empty' do
      expect(subject.empty?(row, col)).to be false
    end

    it 'used object is occupied' do
      expect(subject.occuppied?(row, col)).to be true
    end

    it 'returns the object given the coordinates' do
      expect(subject.get(row: row, col: col)).to eq object
    end
  end

  context 'adding objects' do
    it 'on an empty object' do
      expect(subject.set!(row: rand(subject.rows),
                          col: rand(subject.cols),
                          object: 'x')).to be true
    end
  end

  context 'can move an object to an empty object' do
    let(:row) { subject.rows / 2 }
    let(:col) { subject.cols / 2 }
    let(:object) { Brick.new(subject, row, col) }

    [[-1, 0], [1, 0], [0, -1], [0, 1]].each do |m|
      it "can move from location to #{m}" do
        subject.set!(row: row, col: col, object: object)
        movement_result = subject.move!(row, col, row + m[0], col + m[1])

        expect(movement_result).to be true
        expect(subject.empty?(row, col)).to be true
        expect(subject.empty?(row + m[0], col + m[1])).to be false
        expect(subject.get(row: row + m[0],
                           col: col + m[1])).to be object
      end
    end
  end
end
