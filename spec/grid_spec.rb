require_relative '../grid.rb'

describe Bongard::Grid do

  describe '#initialize' do
    it 'fails if the cell data does not match the size' do
      cells = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
      expect { Bongard::Grid.new(cells, 4) }.to raise_error CellDataSizeError
    end

    it 'fails if the cell data is incomplete' do
      cells = [[1, 2, 3], [4, 5, 6], [7, 8]]
      expect { Bongard::Grid.new(cells, 3) }.to raise_error CellDataSizeError
    end

    it 'fails if the cell data is incomplete' do
      cells = [[1, 2], [4, 5], [7, 8]]
      expect { Bongard::Grid.new(cells, 3) }.to raise_error CellDataSizeError
    end

    it 'fails if the cell data is incomplete' do
      cells = [[1, 2, 3], [4, 5, 6]]
      expect { Bongard::Grid.new(cells, 3) }.to raise_error CellDataSizeError
    end

    it 'fails if the cell data contains nil' do
      cells = [[1, 2, 3], [4, nil, 6], [7, 8, 9]]
      expect { Bongard::Grid.new(cells, 3) }.to raise_error CellDataNilError
    end

    it 'fails if the cell data contains nil' do
      cells = [[1, 2, 3], [4, 5, 6], [7, 8, 9], nil]
      expect { Bongard::Grid.new(cells, 3) }.to raise_error CellDataNilError
    end

    it 'fails if the cell data contains nil' do
      cells = [nil, [4, 5, 6], [7, 8, 9]]
      expect { Bongard::Grid.new(cells, 3) }.to raise_error CellDataNilError
    end

    it 'fails if the size is less than 3' do
      cells = [[1, 2], [3, 4]]
      expect { Bongard::Grid.new(cells, 2) }.to raise_error BelowMinimumSizeError
    end

    it 'fails if the size is less than 3' do
      cells = [[1]]
      expect { Bongard::Grid.new(cells, 1) }.to raise_error BelowMinimumSizeError
    end
  end

  describe '#each' do
    it 'visits all cells once' do
      cells = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
      grid = Bongard::Grid.new(cells, 3)

      tally = Hash.new(0)

      grid.each do |cell|
        tally[cell.value] += 1
      end

      expect(tally).to eq({
        1 => 1,
        2 => 1,
        3 => 1,
        4 => 1,
        5 => 1,
        6 => 1,
        7 => 1,
        8 => 1,
        9 => 1
      })
    end
  end

  describe '#size' do
    it 'returns the size' do
      cells = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
      grid = Bongard::Grid.new(cells, 3)
      expect(grid.size).to eq(3)
    end

    it 'returns the size' do
      cells = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]
      grid = Bongard::Grid.new(cells, 4)
      expect(grid.size).to eq(4)
    end
  end

  describe '#height' do
    it 'is the same as the width' do
      cells = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
      grid = Bongard::Grid.new(cells, 3)
      expect(grid.height).to eq(grid.size)
    end
  end

  describe '#width' do
    it 'is the same as the size' do
      cells = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
      grid = Bongard::Grid.new(cells, 3)
      expect(grid.width).to eq(grid.size)
    end
  end
end
