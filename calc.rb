def say(msg)
  puts "=> #{msg}"
end

say "Enter a number!"
num1 = gets.chomp

say "Enter a second number!"
num2 = gets.chomp

say "What would you like to do? Enter: 1 to add, 2 to subtract, 3 to multiply, or 4 to divide."
operation = gets.chomp

while operation.to_i < 1 || operation.to_i > 4
  say "Please try again. Enter: 1 to add, 2 to subtract, 3 to multiply, or 4 to divide."
  operation = gets.chomp
end

if operation.to_i == 1
  result = num1.to_i + num2.to_i
elsif operation.to_i == 2
  result = num1.to_i - num2.to_i
elsif operation.to_i == 3
  result = num1.to_i * num2.to_i
elsif operation.to_i == 4
  result = num1.to_f / num2.to_f
end

puts "The result is #{result}."