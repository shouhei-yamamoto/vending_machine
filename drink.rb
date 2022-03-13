class Drink

  attr_reader :name, :price
 
  def initialize(name, price)
    @name = name
    @price = price
  end

  def self.cola
    drink = Drink.new(:cola, 120)
  end

  def self.redbull
    drink = Drink.new(:redbull, 200)
  end

  def self.water
    drink = Drink.new(:water, 100)
  end

  # def self.stock
  #   drink_table = []
  #   drink_table << {name: :cola, price:120, stock:5}
  #   drink_table << {name: :water, price:100, stock:5}
  #   stock_list = [Drink.cola, 5, Drink.redbull, 5, Drink.water, 5]

  # end

  def to_s
    "<Drink: name=#{name}, price=#{price}}>"
  end
end