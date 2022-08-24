require "pry"

class Coffee
  attr_reader :name
  attr_accessor :price, :ingredients

  # NOTE: This is utilizing a class variable which is designated with two '@@' symbols:
  # This is so that we can define a 'tally' class variable for ALL instances of the 'Coffee' class
  @@tally = 0

  @@all = []

  def initialize(name, price = 2.50)
    @name = name
    @price = price
    @ingredients = []
    @tally = 0
    # NOTE: This uses the 'shovel' operator to dump the instance into the '@@all' array
    # We can also check the entire value of the '@@all' class variable by using 'Coffee.all' in 'irb'
    binding.pry
    @@all << self
  end

  # NOTE: This is the 'getter' method for the class array variable, '@@all', and since it is using
  # '@@' class variable syntax, we have to use 'self.all' in this scenario:
  def self.all
    @@all
  end

  # NOTE: We have to define our own 'getter' method in this case:
  # NOTE: We also use 'self.tally' in this scenario to force this to be a 'class' method instead
  # of an 'instance' method
  # NOTE: In order to call this method in 'irb', you have to now use 'Coffee.tally'
  def self.tally
    @@tally
  end

  def count()
    @@tally += 1
  end
end

c1 = Coffee.new("Sam", 3.00)
c2 = Coffee.new("Tina")
c3 = Coffee.new("Jacques")

binding.pry
