require './errors.rb'
require './cell.rb'

module Bongard
  class Grid
    attr_reader :size

    def initialize(cell_data, size)
      @size = size

      raise CellDataNilError if contains_nil?(cell_data)
      raise CellDataSizeError unless conforms_to_size?(cell_data)
      raise BelowMinimumSizeError unless @size >= 3

      # intentionally trading memory for convenience
      @rows = cell_data.map { |row| row.map { |e| Cell.new(e) } }
      @cols = @rows.transpose
      @cells = @rows.flatten
    end

    def conforms_to_size?(cell_data)
      return false if cell_data.length != @size
      return false unless cell_data.all? { |row| row.length == @size }
      return true
    end

    def contains_nil?(cell_data)
      return true if cell_data.any? { |row| row.nil? || row.any? { |e| e.nil? } }
      return false
    end

    def each(&block)
      @cells.each &block
    end

    def any?(&block)
      @cells.any? &block
    end

    def all?(&block)
      @cells.all? &block
    end

    def find_all(&block)
      @cells.find_all &block
    end

    def count(&block)
      @cells.count &block
    end

    # 1-indexed
    def cell_at(col_id, row_id); end

    # 1-indexed
    def cells_in_row(row_id); end

    # 1-indexed
    def cells_in_col(col_id); end

    def edge_cells; end

    def corner_cells; end

    def corner_cell(corner); end

    def center_cell; end

    def match?(pattern_selector); end

    def rotate(n); end

    def mirror(axis); end

    def to_s; end

    def to_json; end

    def hash; end

    def ==(); end

    alias_method :height, :size
    alias_method :width, :size
  end
end
