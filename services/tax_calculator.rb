# frozen_string_literal: true

require_relative('application_service')

class TaxCalculator < ApplicationService
  TAX_FREE = %w[book food medicin].freeze
  BASIC_TAX = 0.1
  IMPORT_TAX = 0.05
  NEAREST_DECIMAL = 1 / 0.05

  def initialize(sale)
    @sale = sale
  end

  def call
    basic_tax = tax(@sale['price_before_taxes'], BASIC_TAX) unless TAX_FREE.include?(@sale['type'])
    import_tax = tax(@sale['price_before_taxes'], IMPORT_TAX) if @sale['imported']
    (basic_tax.to_f + import_tax.to_f).round(2)
  end

  private

  def tax(price, tax_rate)
    amount = compute(price, tax_rate)
    round(amount)
  end

  def compute(price, tax_rate)
    price * tax_rate
  end

  def round(amount)
    (amount * NEAREST_DECIMAL).ceil / NEAREST_DECIMAL
  end
end
