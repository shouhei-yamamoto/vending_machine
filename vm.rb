require_relative '/root/workspace/vending_machine/vm.rb'

class Drink
  attr_accessor :list
  def initialize
    @list = {
      Coke: { price: 120, stock: 5},
      Redbull: { price: 200, stock: 5},
      Water: { price: 100, stock: 5}
    }
  end
end

class VendingMachine
  attr_accessor :drink
  attr_reader :sale_amount
  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @sale_amount = 0 
    @slot_money = 0 
    @drink = Drink.new
  end

  def current_slot_money
    @slot_money
  end

  def slot_money(money)
    return puts money unless MONEY.include?(money)
    @slot_money += money
  end

  def return_money
    puts @slot_money
    @slot_money = 0
  end

  def purchase(drink_menu)
    return "お金が足りません" unless @slot_money > drink.list[drink_menu][:price]
    return "在庫がありません" unless drink.list[drink_menu][:stock] > 0
    if @slot_money >= drink.list[drink_menu][:price] && drink.list[drink_menu][:stock] > 0
       puts drink.list[drink_menu][:stock] -= 1
       puts @slot_money -= drink.list[drink_menu][:price]
       puts @sale_amount += drink.list[drink_menu][:price]
    end
  end

  def purchasable_list
    drink.list.map do |key, val|
      key if val[:stock] > 0 && val[:price] <= current_slot_money
    end.compact
  end

  def store(drink_menu)
    puts drink.list[drink_menu][:stock] += 1
  end
end