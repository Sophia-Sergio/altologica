# frozen_string_literal: true

require_relative '../../decorators/sales_printer'
require_relative '../../services/sales_generator'

RSpec.describe SalesPrinter, type: :decorator do
  describe 'call' do
    subject { described_class.new(sales).decorate }


    context 'input 1' do
      let(:expected_output) do
        <<~HEREDOC
          2 book: 24.98
          1 music CD: 16.49
          1 chocolate bar: 0.85
          Sales Taxes: 1.50
          Total: 42.32
        HEREDOC
      end
      let(:sales) { SalesGenerator.call(data_input['input1']) }

      it 'output & expected_output should be eq' do
        puts "\n#{subject}"
        expect(subject).to eq(expected_output)
      end
    end

    context 'input 2' do
      let(:expected_output) do
        <<~HEREDOC
          1 imported box of chocolates: 10.50
          1 imported bottle of perfume: 54.65
          Sales Taxes: 7.65
          Total: 65.15
        HEREDOC
      end
      let(:sales) { SalesGenerator.call(data_input['input2']) }

      it 'output & expected_output should be eq' do
        puts "\n#{subject}"
        expect(subject).to eq(expected_output)
      end
    end

    context 'input 2' do
      let(:expected_output) do
        <<~HEREDOC
          1 imported bottle of perfume: 32.19
          1 bottle of perfume: 20.89
          1 packet of headache pills: 9.75
          3 imported boxes of chocolates: 35.55
          Sales Taxes: 7.90
          Total: 98.38
        HEREDOC
      end
      let(:sales) { SalesGenerator.call(data_input['input3']) }

      it 'output & expected_output should be eq' do
        puts "\n#{subject}"
        expect(subject).to eq(expected_output)
      end
    end
  end
end
