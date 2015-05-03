require 'timeout'
require 'colorize'

@welcome_message = ["\nWelcome to",' .','.','.'," FizzBuzz!\n"]
@game_over_message = ["\n", "Game", " Over\n"]
@rules = ["\nFizzBuzz is a group word game for children to teach them about division.\n",
          "\nThe player designated to go first says the number '1', and each player thenceforth counts one number in turn.\n",
          "\nHowever, any number divisible by three is replaced by the word 'fizz' and any divisible by five by the word 'buzz'.\n",
          "\nNumbers divisible by both become 'fizzbuzz'.\n"]
@levels_intro = ["\nOk #{@name}. How hard would you like the game to be?", "\n1 = Very Easy\n", "8 = Very Hard\n"]
@main_intro = ["\nOk #{@name} we start at 1,", ' you go first,', ' enter your answer,', " and don't forgot to hit Enter...\n"]

def divisible_by_x?(number, x)
  number % x == 0
end

def fizz_buzz_says(number)
  return 'fizzbuzz' if divisible_by_x?(number, 15)
  return 'buzz'     if divisible_by_x?(number, 5)
  return 'fizz'     if divisible_by_x?(number, 3)
  number
end

def generate_numbers_with(limit)
  numbers = []
  1.upto(limit) { |number| numbers << fizz_buzz_says(number).to_s }
  numbers
end

def print_with_sleep(string)
  sleep(1)
  print string
end

def welcome
  @welcome_message.each { |phrase| print_with_sleep phrase }
end

def get_name
  say_rules
  print "\nSo, whats your name?\n"
  @name = gets.chomp.capitalize
end

def say_rules
  @rules.each { |phrase| print_with_sleep phrase }
end

def get_limit
  print "\nOk #{@name}. Enter the number you want to FizzBuzz upto...\n"
  limit = gets.chomp.to_i
  while limit == 0
    puts "Come on #{@name}, thats not a number!\nTry again..."
    limit = gets.chomp.to_i
  end
  return limit
end

def get_level
  @levels_intro.each { |phrase| print_with_sleep phrase }
  level = gets.chomp.to_i
  level = 8 if level > 8
  level = 1 if level < 1
  (level - 10).abs
end

def get_input(secs)
  Timeout.timeout(secs) { gets.chomp.downcase }
  rescue Timeout::Error
    nil
end

def main(numbers, level)
  @main_intro.each { |phrase| print_with_sleep phrase }
  input = get_input(level)
  i = 0
  while input == numbers[i]
    print_with_sleep numbers[i + 1] + "\n"
    i += 2
    return true if i >= numbers.length
    input = get_input(level)
  end
  false
end

def ending(outcome)
  print "Its a draw, would you like to play again #{@name}?\n" if outcome
  print "Haha you lost! Would you like to play again #{@name}?\n" unless outcome
  print "Type y for yes, or n for no. Then hit Enter.\n"
  play if gets.chomp.downcase[-1].chr == 'y'
end

def play
  limit    = get_limit
  level    = get_level
  numbers  = generate_numbers_with(limit)
  outcome  = main(numbers, level)
  ending(outcome)
end

def game_over
  @game_over_message.each { |phrase| print_with_sleep phrase }
end

welcome
get_name
play
game_over
