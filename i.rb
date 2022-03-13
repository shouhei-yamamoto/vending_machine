require_relative '/root/workspace/objectkadai/d.rb'

class VendingMachine

  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @slot_money = 0
    @total_sales = 0
    # @stock_of_redbull = 5
    # @stock_of_water = 5
    @price_of_redbull = Drink.redbull.price
    @price_of_water = Drink.water.price
    @cola = Drink.cola.name
    @stock_of_cola = 5
    @redbull = [Drink.redbull.name, 5]
    @water = [Drink.water.name,  5]

    # 考えているもの　このドリンク要素を一つのメソッド又は他のやり方で一つにまとめれば他でも使いやすくなる？
    # 初期化+在庫管理をしたいが方法が浮かばない。ここで指定できればd.rbのストック不要になる。
    #　flattenメソッドが使える？
    # @stock_of_cola = Array.new(5){Drink.new(name: "cola", price: 120)}
    # @stock_of_redbull =  Array.new(5){Drink.new(name: "redbull", price: 200)}
    # @stock_of_redbull = Array.new(5){Drink.new(name: "water", price: 100)}
  end
  
  # 現在の金額
  def current_money
    @slot_money
  end
  
  # 投入金額
  def slot_money(money)
    return false unless MONEY.include?(money)
    @slot_money += money
  end
  
  # 返金処理
  def return_money
    puts @slot_money
    @slot_money = 0
  end
  
  # コーラの購入
  def purchase_cola
    return false unless @slot_money >= Drink.cola.price
    return false if @stock_of_cola <= 0
    @slot_money -= Drink.cola.price
    @total_sales += Drink.cola.price
    @stock_of_cola -= 1
    p "只今の投入残額:#{current_money}円"
  end 
  
  # コーラのストック
  def stock_of_cola
    @stock_of_cola
  end

  # コーラの販売
  def store_cola
    @stock_of_cola += 1
  end
  
  # レッドブルの購入
  def purchase_redbull
    return false unless @slot_money >= @price_of_redbull
    return false if @redbull[1] <= 0
    @slot_money -= @price_of_redbull
    @total_sales += @price_of_redbull
    @redbull[1] -= 1
    p "只今の投入残額:#{current_money}円"
  end  

  # レッドブルのストック
  def stock_of_redbull
    @redbull[1]
  end
  
  # レッドブルの販売
  def store_redbull
    @redbull[1] += 1
  end
  
  #　水の購入
  def purchase_water
    @slot_money = @slot_money - @price_of_water
    @total_sales += @price_of_water
    @water[1] -= 1
    # self.stock[:water] -= 1
    p "只今の投入残額:#{current_money}円"
  end  
  
  # 水のストック
  def stock_of_water
    @water[1]
    # self.stock[:water]
  end
  
  # 総売り上げ
  def total_sales
    @total_sales
  end

  # def price_list
  #   [Drink.cola.price, @price_of_redbull, @price_of_water]
  # end
  # def stock
  #   @stock = {cola: 5, redbull: 5, water: 5}
  # end
  # def stock
  #   p @stock_of_cola, @redbull, @water
  # end

  def drink_list
    {@cola => Drink.cola.price, @redbull[0] => @price_of_redbull, @water[0] => @price_of_water}
  end

  def able_to_buy_something?
    @slot_money >= self.drink_list.values.min
  end
  
  def choices
    if (@slot_money >= self.drink_list.values.max)
      p self.drink_list.keys
    elsif (@slot_money >= Drink.cola.price)
      p @cola, @water[0]
    elsif (@slot_money >= @water[1])
      p @water[0]
    else
      p 'お金が足りません'
    end
  end
end

# vm = VendingMachine.new
# vm.slot_money (100)
# vm.current_money
# vm.return_money
# vm.purchase_cola
# vm.total_sales
# vm.stock_of_cola