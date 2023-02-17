# frozen_string_literal: true

require_relative '../../services/sales_generator'

RSpec.describe SalesGenerator, type: :service do
  describe 'call' do
    context 'input 1' do
      let(:expected_output) do
        {
          sales_count: 3,
          taxes: 1.5000000000000018,
          total: 42.32
        }
      end

      subject { described_class.call(data_input['input1']) }

      it 'output & expected_output should be eq' do
        expect(subject.total).to eq(expected_output[:total])
        expect(subject.taxes).to eq(expected_output[:taxes])
        expect(subject.items.count).to eq(expected_output[:sales_count])
        expect(subject.items.sum(&:total)).to eq(subject.total)
        expect(subject.items.sum(&:tax)).to eq(subject.taxes)
      end
    end

    context 'input 2' do
      let(:expected_output) do
        {
          sales_count: 2,
          taxes: 7.649999999999999,
          total: 65.15
        }
      end

      subject { described_class.call(data_input['input2']) }

      it 'output & expected_output should be eq' do
        expect(subject.total).to eq(expected_output[:total])
        expect(subject.taxes).to eq(expected_output[:taxes])
        expect(subject.items.count).to eq(expected_output[:sales_count])
        expect(subject.items.sum(&:total)).to eq(subject.total)
        expect(subject.items.sum(&:tax)).to eq(subject.taxes)
      end
    end

    context 'input 3' do
      let(:expected_output) do
        {
          sales_count: 4,
          taxes: 7.899999999999995,
          total: 98.38
        }
      end

      subject { described_class.call(data_input['input3']) }

      it 'output & expected_output should be eq' do
        expect(subject.total).to eq(expected_output[:total])
        expect(subject.taxes).to eq(expected_output[:taxes])
        expect(subject.items.count).to eq(expected_output[:sales_count])
        expect(subject.items.sum(&:total)).to eq(subject.total)
        expect(subject.items.sum(&:tax)).to eq(subject.taxes)
      end
    end
  end
end
