require File.expand_path('../models/sale', __dir__)

class SaleGeneratorService
  TAX_FREE = %w[book food medicin].freeze
  BASIC_TAX = 0.1
  IMPORT_DUTY = 0.05
  NEAREST_DECIMAL = 1 / 0.05

  def initialize(sales)
    @sales = sales
  end

  def call
    @lines = []
    total = 0
    taxes = 0
    sales.each do |sale|
      @lines.push("#{sale.quantity} #{sale.name}: #{sprintf('%.2f', sale.price)}")
      total += sale.price
      taxes += sale.tax
    end
    @lines.push("Sales Taxes: #{sprintf('%.2f', taxes)}")
    @lines.push("Total: #{sprintf('%.2f', total)}")
    @lines
  end

  def sale_data(sale)
    sale["basic_tax"] = TAX_FREE.include?(sale["type"]) ? 0.0 : set_tax(sale["cost"], BASIC_TAX)
    sale["import_tax"] = sale["imported"] ? set_tax(sale["cost"], IMPORT_DUTY) : 0.0
    sale["total"] = sale["cost"] + add_taxes(sale["basic_tax"], sale["import_tax"])
    sale
  end

  def sales
    @sales.map {|data| Sale.new(sale_data(data)) }
  end

  def sum_taxes(good_tax, import_tax)
    amount = good_tax + import_tax
    amount.round(2)
  end

  def tax(base_total, tax_rate)
    amount = compute_tax(base_total, tax_rate)
    round_tax(amount)
  end

  def compute_tax(item_price, tax_rate)
    item_price * tax_rate
  end

  def round_tax(amount)
    ((amount * NEAREST_DECIMAL).ceil / NEAREST_DECIMAL)
  end
end
