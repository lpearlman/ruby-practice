#!/usr/bin/env ruby

class Row

  MaxCells=3
  EmptyCell='-'

  def initialize
    @cells = [Row::EmptyCell, Row::EmptyCell, Row::EmptyCell]
  end

  def set_cell(column, value)
    if @cells[column] == '-'
      @cells[column] = value.upcase
      return true
    else
      puts "Cell already taken by #{@cells[column]}"
      return false
    end
  end

  def get_cell(column)
    return @cells[column]
  end

  def print
    puts @cells.join(" ")
  end

  def has_empty_cells
    @cells.include?(EmptyCell)
  end

  def is_winner(value)
    @cells.each do |cell_value|
      if cell_value != value
        return false
      end
    end
    return true
end

end

class Board

  def initialize
    @rows = [
      Row.new,
      Row.new,
      Row.new
    ]
  end

  public
  def set_X(row, col)
    self.set_cell('X', row-1, col-1)
  end

  def set_Y(row, col)
    self.set_cell('Y', row-1, col-1)
  end

  def won_or_done(value)
    if self.is_winner(value)
      puts "#{value} wins!!!"
      return true
    elsif self.game_over
      puts "Sorry, game over. No one wins."
      return true
    end
    return false
  end

  def print
    @rows.each { |row| row.print }
  end

private
  def check_rows_for_winner(value)
    @rows.each do |row|
      if row.is_winner(value)
        return true
      end
    end
    return false
  end

  def check_columns_for_winner(value)
    (0..(Row::MaxCells-1)).each do |column|
      winner = true
      @rows.each do |row|
        if row.get_cell(column) != value
          winner = false
          break
        end
      end
      if winner
        return true
      end
    end

    return false
  end

  def check_diagonal_for_winner(value, from, to)
    if from <= to
      (from..to).each do |column|
        if @rows[column].get_cell(column) != value
          return false
        end
      end
    else 
      (from).downto(to) do |column|
        if @rows[column].get_cell(column) != value
          return false
        end
      end
    end
    return true
  end

  def set_cell(value, row, col)
    if ! self.valid_coordinates(row, col)
      return false
    end

    if ! @rows[row].set_cell(col, value)
      return false
    end

    return true
  end

  def valid_coordinates(row, col)
    if (!(0..2).include?(row))
      puts "Invalid row: #{row}. Must be a value between 1 and 3"
      return false
    end

    if (!(0..2).include?(col))
      puts "Invalid column: #{col}. Must be a value between 1 and 3"
      return false
    end

    return true
  end

  def is_winner(value)
    if self.check_rows_for_winner(value)
      return true
    end
    if self.check_columns_for_winner(value)
      return true
    end
    if self.check_diagonal_for_winner(value, 0, 2)
      return true
    end
    return self.check_diagonal_for_winner(value, 2, 0)
  end

  def game_over
    done = true
    @rows.each do |row|
      if row.has_empty_cells
        done = false
      end
    end
    return done
  end

end

board = Board.new
loop do
  loop do
    board.print
    puts 'Enter row for X (1 - 3)'
    row = gets.chomp
    puts 'Enter column for X (1 - 3)'
    column = gets.chomp
    if board.set_X(row.to_i, column.to_i)
      break
    end
  end
  if board.won_or_done('X')
    break
  end
  loop do
    board.print
    puts 'Enter row for Y (1 - 3)'
    row = gets.chomp
    puts 'Enter column for Y (1 - 3)'
    column = gets.chomp
    if board.set_Y(row.to_i, column.to_i)
      break
    end
  end
  if board.won_or_done('Y')
    break
  end
end