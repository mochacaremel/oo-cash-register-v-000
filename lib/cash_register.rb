require "pry"
class CashRegister
  attr_accessor :total, :discount

  @@items = []
  @@last_item = []

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @@items.clear
  end

  def discount
    @discount
  end

  def add_item(title, price, quantity=1)
    @total += (price * quantity)
    @@last_item[0], @@last_item[1], @@last_item[2] = title, price, quantity
    while quantity > 0
      @@items << title
      quantity -= 1
    end
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      @total -= (@total * (@discount / 100.to_f))
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @@items
  end

  def void_last_transaction
    price, quantity = @@last_item[1], price = @@last_item[2]
    @total -= (price * quantity)
    @@last_item.clear
    @@items.slice!(-1,quantity)
  end
end
