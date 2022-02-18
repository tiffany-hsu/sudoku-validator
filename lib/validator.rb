require_relative './sudoku'

class Validator
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    sudoku = Sudoku.new(@puzzle_string)
    if sudoku.valid?
      if sudoku.completed?
        return 'This sudoku is valid.'
      else
        return 'This sudoku is valid, but incomplete.'
      end
    else
      return 'This sudoku is invalid.'
    end
  end

end
