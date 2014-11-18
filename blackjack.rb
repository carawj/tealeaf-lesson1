play_again = 'y'

def say(msg)
  puts "#{msg}"
  puts "--------------------------------------"
end

def calculate_total(cards)
  numbers_only = cards.map { |second| second[1] }
  total = 0

  numbers_only.each do |value|
    if value == 'Ace'
        total += 0
    elsif value.to_i == 0
      total += 10
    else
      total += value.to_i
    end
  end

  numbers.each do |ace_value|
    if ace_value == 'Ace'
      if total <= 10
        total += 11
      else
        total += 1
      end
    end
  end
  total
end

puts "What's your name?"
player_name = gets.chomp
say "Welcome to Blackjack, #{player_name}!"

while play_again.downcase == 'y'
  player_choice = '1'
  
  suits = ['Hearts', 'Diamonds', 'Spades', 'Clubs']
  cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']
  deck = suits.product(cards)

  puts "How many decks would you like to use?"
  number_of_decks = gets.chomp.to_i
  say "Number of decks in use: #{number_of_decks}."

  full_deck = deck.dup * number_of_decks
  full_deck.shuffle!

  player_cards = []
  computer_cards = []

  player_cards << full_deck.pop
  computer_cards << full_deck.pop
  player_cards << full_deck.pop
  computer_cards << full_deck.pop

  player_total = calculate_total(player_cards)
  computer_total = calculate_total(computer_cards)

  puts "#{player_name}, your cards are #{player_cards[0][1].to_s} of #{player_cards[0][0].to_s} and #{player_cards[1][1].to_s} of #{player_cards[1][0].to_s}."
  say "Your total is #{player_total}."
  puts "The dealer's cards are #{computer_cards[0][1].to_s} of #{computer_cards[0][0].to_s} and #{computer_cards[1][1].to_s} of #{computer_cards[1][0].to_s}."
  say "Their total is #{computer_total}."

  while player_choice == '1' && player_total <= 20
    puts "Would you like to hit or stay? (Please put 1 to hit or 2 to stay.)"
    player_choice = gets.chomp
    if player_choice == '1'
      player_cards << full_deck.pop
      player_total = calculate_total(player_cards)
      puts "--------------------------------------"
      puts "#{player_name}, your new card is #{player_cards.last[1].to_s} of #{player_cards.last[0].to_s}."
      say "Your total is now #{player_total}."
    elsif player_choice == '2'
      say "You chose to stay."
    else 
      puts "That's not a valid choice. Would you like to hit or stay? (Please put 1 to hit or 2 to stay.)"
      player_choice = gets.chomp
    end
  end

  while computer_total < 17
    computer_cards << full_deck.pop
    computer_total = calculate_total(computer_cards)
  end

  puts "#{player_name}, your final total is #{player_total}."
  say "The dealer's final total is #{computer_total}."

  if (player_total >= 22 && computer_total >= 22) || (player_total == computer_total)
    say "It's a tie!"
  elsif player_total >= 22 && computer_total <= 21
    say "The dealer won this round!"
  elsif player_total <= 21 && computer_total >= 22
    say "#{player_name} won this round!"
  elsif player_total > computer_total
    say "#{player_name} won this round!"
  else
    say "The dealer won this round!"
  end
  
  puts "Would you like to play again (y/n)?"
  play_again = gets.chomp
  system "cls"

end