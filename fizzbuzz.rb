# This is our fizzbuzz example

# Create arrays to hold results
fizz = []
buzz = []
fizzbuzz = []
numbers = []

# Run FizzBuzz
puts "Running FizzBuzz"
(1..1000).each do |n|
  if n % 15 == 0
    puts "fizzbuzz"
    fizzbuzz << n
  elsif n % 5 == 0
    puts "buzz"
    buzz << n
  elsif n % 3 == 0
    puts "fizz"
    fizz << n
  else
    puts n
    numbers << n
  end
end

# Print results
puts "******************"
puts "fizz: #{fizz.count}"
puts "buzz: #{buzz.count}"
puts "fizzbuzz: #{fizzbuzz.count}"
puts "numbers: #{numbers.count}"
puts "total: #{fizz.count + buzz.count + fizzbuzz.count + numbers.count}"
puts "******************"