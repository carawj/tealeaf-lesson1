# here are the variables
keep_playing = 'y'

# here are the methods
def computer_pick(computer_num) #to convert the computer's random number to a word
  if computer_num == 1
      computer_choice = 'rock'
  elsif computer_num == 2
    computer_choice = 'paper'
  else
    computer_choice = 'scissors'
  end
end

def player_pick(player_num) #to convert the player's letter choice to a word
  if player_num == 'r'
    player_choice = 'rock'
  elsif player_num == 'p'
    player_choice = 'paper'
  elsif player_num == 's'
    player_choice = 'scissors'
  end
end

def win_conditions(player_choice, computer_choice) #to work out who wins
  if player_choice == computer_choice
    puts "It's a tie!"
  elsif 
    player_choice == 'rock' && computer_choice == "paper"
    puts "Sorry, the computer wins this time!"
  elsif 
    player_choice == 'rock' && computer_choice == "scissors"
    puts "Congrats, you win!"
  elsif 
    player_choice == 'paper' && computer_choice == "scissors"
    puts "Sorry, the computer wins this time!"
   elsif 
    player_choice == 'paper' && computer_choice == "rock"
    puts "Congrats, you win!"
   elsif 
    player_choice == 'scissors' && computer_choice == "paper"
    puts "Congrats, you win!"
  elsif 
    player_choice == 'scissors' && computer_choice == "rock"
    puts "Sorry, the computer wins this time!"
  end
end


# here is where the gameplay starts
puts "Let's play Rock Paper Scissors!"

while keep_playing == 'y'
  puts "--------------------------------------------------"
  puts "Your turn! Enter R for rock, P for paper or S for scissors:"
  player_num = gets.chomp

  while !['r', 's', 'p'].include?(player_num)
  puts "I'm afraid #{player_num} isn't a valid choice. Please enter R for rock, P for paper or S for scissors:"
  player_num = gets.chomp
  end

  computer_num = rand(1..3)
  computer_choice = computer_pick(computer_num)
  player_choice = player_pick(player_num)

  puts "You picked #{player_choice} and the computer picked #{computer_choice}."

  win_conditions(player_choice, computer_choice)

  puts "Would you like to play again? Please enter y or n."
  keep_playing = gets.chomp

end