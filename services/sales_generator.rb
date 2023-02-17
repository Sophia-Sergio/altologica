# frozen_string_literal: true

require_relative('application_service')
require_relative('sale_creator')

class SalesGenerator < ApplicationService
  Sales = Struct.new(:total, :taxes, :items)

  def initialize(data, sale_creator = SaleCreator)
    @data = data
    @sale_creator = sale_creator
    @total = 0
    @taxes = 0
  end

  def call
    items.each do |sale|
      @total += sale.total
      @taxes += sale.tax
    end
    Sales.new(total: @total, taxes: @taxes, items: items)
  end

  private

  def items
    @items ||= @data.map { |sale| @sale_creator.call(sale) }
  end
end
