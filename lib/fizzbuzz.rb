require "timeout"
require "colorize"

def is_divisible_by_x(number, x)
  number % x == 0
end

def fizz_buzz_says(number)
  return "fizzbuzz" if is_divisible_by_x(number, 15)
  return "buzz"     if is_divisible_by_x(number, 5) 
  return "fizz"     if is_divisible_by_x(number, 3)
  return number
end

def generate_numbers_with(limit)
  numbers = []
  1.upto(limit) { |number| numbers << fizz_buzz_says(number).to_s }
  numbers
end
  
def welcome_message
  print "\nWelcome"; sleep(1); print " to"; sleep(1); print " ."; sleep(1);
  print "."; sleep(1); print "."; sleep(1); print " FizzBuzz!\n"
end

def get_name
  rules
  puts "\nSo, whats your name?"
  gets.chomp.capitalize
end

def rules
  sleep(1); puts "\nFizzBuzz is a group word game for children to teach them about division."
  sleep(1); puts "\nThe player designated to go first says the number '1', and each player thenceforth counts one number in turn."
  sleep(1); puts "\nHowever, any number divisible by three is replaced by the word 'fizz' and any divisible by five by the word 'buzz'."
  sleep(1); puts "\nNumbers divisible by both become 'fizzbuzz'."; sleep(1)
end

def get_limit_from(name)
  puts "\nOk #{name}. Enter the number you want to FizzBuzz upto..."
  limit = gets.chomp.to_i
  # while limit == 0
  #   puts "Come on #{name}, thats not a number!\nTry again..."
  #   limit = gets.chomp.to_i
  # end
end

def get_level_from(name)
  puts "\nOk #{name}. How hard would you like the game to be?"; sleep(1)
  puts "\n1 = Very Easy".green; sleep(1); puts "8 = Very Hard".red
  level = gets.chomp.to_i
  level = 8 if level > 8; level = 1 if level < 1
  level = (level - 10).abs
end

def get_input(secs)
  Timeout::timeout(secs) { gets.chomp.downcase }
  rescue Timeout::Error
  nil
end

def main(numbers, level, name)
  print "\nOk #{name} we start at 1,"; sleep(2); print " you go first,"; sleep(2); 
  print " enter your answer,"; sleep(2); puts " and don't forgot to hit Enter..."; sleep(1)
  input = get_input(level) 
  i = 0
  while input == numbers[i]
    sleep(1); puts numbers[i + 1].blue
    i += 2
    return true if i >= numbers.length
    input = get_input(level)
  end
  return false
end

def ending(outcome, name)
  puts "Its a draw, would you like to play again #{name}?" if outcome == true
  puts "Haha you lost! Would you like to play again #{name}?" if outcome == false
  puts "Type y for yes, or n for no. Then hit Enter."
  play_with(name) if gets.chomp.downcase[-1].chr == "y"
end

def play_with(name)
  limit    = get_limit_from(name)
  level    = get_level_from(name)
  numbers  = generate_numbers_with(limit)
  outcome  = main(numbers, level, name)
  ending(outcome, name)
end

def game_over
  puts ""; sleep(1)
  print "Game".red; sleep(1)
  puts " Over".red; sleep(1)
end

welcome_message
name = get_name
play_with(name)
game_over