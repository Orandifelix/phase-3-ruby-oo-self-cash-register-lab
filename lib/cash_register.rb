class CashRegister
  attr_reader :discount
  attr_accessor :total, :items, :last_transaction

  def initialize(discount = nil)
    @discount = discount
    @total = 0
    @items = []
  end

  def add_item(title, price, quantity = 1)
    quantity.times { @items << title }
    @last_transaction = price * quantity
    @total += @last_transaction
  end

  def apply_discount
    if @discount
      discount_amount = @total * (@discount.to_f / 100)
      @total -= discount_amount
      "After the discount, the total comes to $#{total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction
  end
end




