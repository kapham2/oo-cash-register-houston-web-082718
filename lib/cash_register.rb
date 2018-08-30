class CashRegister

  attr_reader :discount
  attr_accessor :total, :items, :last_price

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, qty = 1)
    for i in 1..qty do
      self.items << title
    end
    self.total += price * qty

    self.last_price = price
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else
      self.total = (@total * (100.0 - @discount) / 100).to_i
      "After the discount, the total comes to $#{self.total}."
    end
  end

  def void_last_transaction
    self.total -= last_price
  end

end
