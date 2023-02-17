# frozen_string_literal: true

class SalesPrinter
  def initialize(sales)
    @sales = sales
  end

  def decorate
    <<~HEREDOC
      #{@sales.items.map { |sale| format_sale(sale) }.join("\n")}
      Sales Taxes: #{format_number(@sales.taxes)}
      Total: #{format_number(@sales.total)}
    HEREDOC
  end

  private

  def format_sale(sale)
    "#{sale.quantity} #{sale.name}: #{format_number(sale.total)}"
  end

  def format_number(number)
    format('%.2f', number)
  end
end
