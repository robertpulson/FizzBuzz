def is_divisible_by_x(number, x)
  number % x == 0
end

def fizz_buzz_says(number)
    return "fizzbuzz" if is_divisible_by_x(number, 15) == true
    return "buzz"     if is_divisible_by_x(number, 5)  == true
    return "fizz"     if is_divisible_by_x(number, 3)  == true
    return number
end

def generate_numbers_with(limit)
  numbers = []
  1.upto(limit) do |number|
    numbers << fizz_buzz_says(number).to_s
  end
  numbers
end
  
def welcome_message
  print "\nWelcome"; sleep(1); print " to"; sleep(1); print " ."; sleep(1);
  print "."; sleep(1); print "."; sleep(1); print " FizzBuzz!\n"; sleep(1)
end

def get_name
  rules
  puts "\nSo, whats your name?"
  gets.chomp.capitalize
end

def rules
  puts "\nFizzBuzz is a group word game for children to teach them about division."
  sleep(4)
  puts "\nThe player designated to go first says the number '1', and each player thenceforth counts one number in turn."
  sleep(4)
  puts "\nHowever, any number divisible by three is replaced by the word 'fizz' and any divisible by five by the word 'buzz'."
  sleep(4)
  puts "\nNumbers divisible by both become 'fizzbuzz'."
  sleep(4)
end

def get_limit_from(name)
  puts "\nOk #{name}. Enter the number you want to FizzBuzz upto..."
  limit = gets.chomp.to_i
  # while limit == 0
  #   puts "Come on #{name}, thats not a number!\nTry again..."
  #   limit = gets.chomp.to_i
  # end
end

def main(numbers, name)
  puts "\nOk #{name} we start at 1, you go first..."
  input = gets.chomp.downcase; i = 0
  while input == numbers[i]
    sleep(1) 
    puts numbers[i + 1]
    i += 2
    return true if i >= numbers.length
    input = gets.chomp.downcase
  end
  return false
end

def ending(outcome, name)
  puts "Its a draw, would you like to play again #{name}?" if outcome == true
  puts "Haha you lost! Would you like to play again #{name}?" if outcome == false
  puts "Type y for yes, or n for no. Then hit Enter."
  response = gets.chomp.downcase
  play_with(name) if response == "y"
end

def play_with(name)
  limit    = get_limit_from(name)
  numbers  = generate_numbers_with(limit)
  outcome  = main(numbers, name)
  response = ending(outcome, name)
end

def game_over
  puts "";      sleep(1)
  print "Game"; sleep(1)
  puts " Over"; sleep(1)
end

welcome_message
name = get_name
play_with(name)
game_over