require "fizzbuzz"

describe 'FizzBuzz' do
  
  it "should know if a number is divisible by 3" do
    expect(is_divisible_by_3(3)).to be true
  end

  it "should know if a number is divisible by 5" do
    expect(is_divisible_by_5(5)).to be true
  end

  it "should know if a number is divisible by 15" do
    expect(is_divisible_by_15(15)).to be true
  end

  it "should return fizz if a number is divisible by 3" do
    expect(fizz_buzz_says(3)).to eq "Fizz"
  end

  it "should return buzz if a number is divisible by 5" do
    expect(fizz_buzz_says(5)).to eq "Buzz"
  end

  it "should return fizzbuzz if a number is divisible by 15" do
    expect(fizz_buzz_says(15)).to eq "FizzBuzz"
  end

  it "should return the number if it is not divisible by 3 or 5" do
    expect(fizz_buzz_says(4)).to eq 4
  end

end