WIN_COMBINATIONS = [
 [0,1,2],
 [3,4,5],
 [6,7,8],
 [0,3,6],
 [1,4,7],
 [2,5,8],
 [0,4,8],
 [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  user_input = input.to_i - 1
end

def move(board, index, current_player)
  board[index] = current_player
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def valid_move?(board, index)
 if index.between?(0,8) && !position_taken?(board,index)
end

def turn_count(board)
  turn = 0
  board.each do |index|
    if index == "X" || index == "O"
      turn += 1
    end
  end
  return turn
end

def current_player(board)
  if num_turns % 2 == 0
    player = "X"
  else
    player = "O"
  end
  return player
end

def turn(board)
  puts "Please choose a number 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(board, index)
    player_token = current_player(board)
    move(board, index, player_token)
    display_board(board)
  else
    turn(board)
  end
end

 def won?(board)
   WIN_COMBINATIONS.detect do |win_combination|
     win_index_1 = win_combination[0]
     win_index_2 = win_combination[1]
     win_index_3 = win_combination[2]

     position_1 = board[win_index_1]
     position_2 = board[win_index_2]
     position_3 = board[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
  else
    false
   end
  end
 end

 def full?(board)
   !board.detect{|index| index == " "}
 end

 def draw?(board)
   if !won?(board) && full?(board)
     true
   else
     false
   end
 end

 def over?(board)
   won?(board) || full?(board) || draw?(board)
 end

 def winner(board)
   if draw?(board)
     return nil
   elsif over?(board)
     return board[won?(board)[0]]
   else
     return nil
   end
 end

 if won?(board)
   puts "Congratulations #{winner(board)}!"
 else draw?(board)
   puts "Cat's Game!"
 end
end
