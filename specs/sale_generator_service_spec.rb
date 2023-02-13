require File.expand_path('../services/sale_generator_service', __dir__)
require 'byebug'
require 'json'

RSpec.describe SaleGeneratorService, type: :service do
  let(:input) {
    path = File.join(File.dirname(__FILE__), '../db/input.json')
    JSON.parse(File.read(path))
  }

  let(:expected_output1) {
    [
      '2 book: 24.98',
      '1 music CD: 16.49',
      '1 chocolate bar: 0.85',
      'Sales Taxes: 1.50',
      'Total: 42.32',
    ]
  }
  let(:expected_output2) {
    [
      '1 imported box of chocolates: 10.50',
      '1 imported bottle of perfume: 54.65',
      'Sales Taxes: 7.65',
      'Total: 65.15',
    ]
  }

  let(:expected_output3) {
    [
      '1 imported bottle of perfume: 32.19',
      '1 bottle of perfume: 20.89',
      '1 packet of headache pills: 9.75',
      '3 imported boxes of chocolates: 35.55',
      'Sales Taxes: 7.90',
      'Total: 98.38',
    ]
  }

  describe "call" do
    context "input 1" do
      it "output & expected_output should be eq" do
        output = described_class.new(input["input1"]).call
        expect(output).to eq(expected_output1)
      end
    end

    context "input 2" do
      it "output & expected_output should be eq" do
        output = described_class.new(input["input2"]).call
        expect(output).to eq(expected_output2)
      end
    end

    context "input 3" do
      it "output & expected_output should be eq" do
        output = described_class.new(input["input3"]).call
        expect(output).to eq(expected_output3)
      end
    end
  end
end
