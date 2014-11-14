WINNING_LINES = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]

# here are the methods

def reset_board(board)
  board = {1 => ' ', 2 => ' ', 3 => ' ', 4 => ' ', 5 => ' ', 6 => ' ', 7 => ' ', 8 => ' ', 9 => ' '}
  board
end

def empty_positions(board)
  board.keys.select {|position| board[position] == ' '}
end

def draw_board(board)
  system "cls"
  puts "     |     |     "
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |          "
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |          "
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
end


def has_anyone_won?(board)
  WINNING_LINES.each do |line|
    return "You" if board.values_at(*line).count('X') == 3
    return "The computer" if board.values_at(*line).count('O') == 3
  end
  nil
end

# here is where the gameplay starts
puts "Would you like to play Tic Tac Toe (y/n)?"
puts "-----------------------"
keep_playing = gets.chomp.downcase

while keep_playing == 'y'

  # clear the board
  # draw the board
  board = reset_board(board)
  draw_board(board)

  # player moves
  begin
    begin
    puts "Please choose a position on the board (from 1 to 9):"
    position = gets.chomp.to_i
   # check if position is valid
    end until empty_positions(board).include?(position)
  # position X
    board[position] = 'X'
  # check if anyone has won
    winner = has_anyone_won?(board)
  # computer moves (random)
  # check if position is valid
    position = empty_positions(board).sample
  # position O
    board[position] = 'O'
  # check if anyone has won
    winner = has_anyone_won?(board)
  # draw the board
    draw_board(board)

  end until winner || empty_positions(board) == []

  if winner
    puts "#{winner} won this time!"
  else
    puts "It's a tie."
  end

  puts "Would you like to play again? (y/n)"
  keep_playing = gets.chomp.downcase

end