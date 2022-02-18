RSpec.describe Sudoku do
  it 'has a string' do
    sudoku = Sudoku.new("Sudoku string here")
    expect(sudoku.sudoku_string).to eq('Sudoku string here')
  end

  describe "valid?" do
    context "given an empty string" do
      it "returns false" do
        sudoku = Sudoku.new("")
        expect(sudoku.valid?).to eq false
      end
    end

    context "given an empty string" do
      it "returns false" do
        sudoku = Sudoku.new(
          "8 5 9 |6 1 2 |4 3 7
          7 2 3 |8 5 4 |1 6 9
          1 6 4 |3 7 9 |5 2 8
          ------+------+------
          9 8 6 |1 4 7 |3 5 2
          3 7 5 |2 6 8 |9 1 4
          2 4 1 |5 9 3 |7 8 6
          ------+------+------
          4 3 2 |9 8 1 |6 7 5
          6 1 7 |4 2 5 |8 9 3")
        expect(sudoku.valid?).to eq false
      end
    end

    context "given an non-digit characters" do
      it "returns false" do
        sudoku = Sudoku.new(
          "8 5 9 |6 1 2 |4 3 7
          7 2 3 |8 5 4 |1 6 9
          1 6 4 |3 7 9 |5 2 j
          ------+------+------
          9 8 6 |1 4 d |3 5 2
          3 7 5 |2 6 8 |9 1 4
          2 4 y |5 9 3 |z 8 6
          ------+------+------
          4 3 2 |9 8 1 |6 7 5
          6 1 7 |4 2 5 |8 9 3
          5 9 8 |7 3 6 |2 4 1")
        expect(sudoku.valid?).to eq false
      end
    end
  end
end