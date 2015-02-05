class Fixnum

  def playFizzBuzz
    output = ""
    if self % 3 == 0
      output << "Fizz"
      if self % 5 == 0
        output << "Buzz"
      end
    elsif self % 5 == 0
      output << "Buzz"
    else
      output = self
      output
    end
    output
  end

end