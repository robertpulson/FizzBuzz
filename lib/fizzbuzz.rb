def is_divisible_by_3(number)
  number % 3 == 0
end

def is_divisible_by_5(number)
  number % 5 == 0
end  

def is_divisible_by_15(number)
  number % 15 == 0
end

def fizz_buzz_says(number)
    return "fizzbuzz" if is_divisible_by_15(number) == true
    return "buzz" if is_divisible_by_5(number) == true
    return "fizz" if is_divisible_by_3(number) == true
    return number
end

def generate_numbers(limit)
  numbers = {}
  i = 1
  while i <= limit
    numbers[i] = fizz_buzz_says(i).to_s
    i = i + 1
  end
  return numbers
end

def get_limit
  puts "Welcome to FizzBuzz!"
  puts "Enter the number you want to FizzBuzz to..."
  limit = gets.chomp.to_s
  return limit
end

def play_game(numbers)
  puts "Ok we start at 1, you go first..."
  input = gets.chomp
  i = 1
  while i <= numbers.count - 2
    while input == numbers[i]
      puts numbers[i + 1]
      i = i + 2
      input = gets.chomp
    end
  end
end

limit = get_limit
numbers = generate_numbers(limit.to_i)
play_game(numbers)



