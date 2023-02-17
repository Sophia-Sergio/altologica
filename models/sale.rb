# frozen_string_literal: true

class Sale
  attr_reader :name, :quantity, :price_after_taxes, :price_before_taxes

  def initialize(data)
    @quantity = data['quantity']
    @name = data['name']
    @price_before_taxes = data['price_before_taxes']
    @price_after_taxes = data['price_after_taxes']
  end

  def total
    price_after_taxes * quantity
  end

  def tax
    (total - (price_before_taxes * quantity))
  end
end
