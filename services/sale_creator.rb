# frozen_string_literal: true

require_relative('application_service')
require_relative('../models/sale')
require_relative('tax_calculator')

class SaleCreator < ApplicationService
  def initialize(sale, tax_calculator = TaxCalculator)
    @sale = sale
    @tax_calculator = tax_calculator
  end

  def call
    @sale['price_after_taxes'] = @sale['price_before_taxes'] + @tax_calculator.call(@sale)
    Sale.new(@sale)
  end
end
