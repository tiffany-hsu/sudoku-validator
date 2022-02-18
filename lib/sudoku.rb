require 'set'

class Sudoku
  attr_reader :sudoku_string

  def initialize(sudoku_string)
    @sudoku_string = sudoku_string
  end

  def valid?
    sudoku_arr = build_arr
    passed = Set.new

    if (sudoku_arr.empty?) || (sudoku_arr.flatten.length != 81) || !(sudoku_arr.flatten.grep(/^\D/).empty?)
      return false
    end
    sudoku_arr.each_with_index do | row, i |
      sudoku_arr.each_with_index do | col, j |
        current = sudoku_arr[i][j]
        if current != "0"
          if (!passed.add?(current + "in row" + i.to_s) ||
              !passed.add?(current + "in col" + j.to_s) ||
              !passed.add?(current + "in subgroup" + (i/3).to_s + "," + (j/3).to_s))
            return false
          end
        end
      end
    end
    return true
  end

  def completed?
    sudoku_arr = build_arr.flatten!
    !sudoku_arr.include?("0")
  end

  def build_arr
    arr = []

    split_rows = sudoku_string.split("\n")
    split_rows.each do |row|
      row.delete!"|"
    end
    s = split_rows.reject { |x| x.include?("-") }

    s.each do |row|
      arr << row.split(" ")
    end

    return arr
  end
end