class Sale
  attr_reader :name, :quantity, :cost, :tax_percentage, :total

  def initialize(data)
    @quantity = data["quantity"]
    @name = data["name"]
    @cost = data["cost"]
    @total = data["total"]
    @tax_percentage = data["tax_percentage"]
  end

  def price
    total * quantity
  end

  def tax
    (price - (cost * quantity))
  end
end
