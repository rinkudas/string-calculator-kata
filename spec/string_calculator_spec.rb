require_relative '../lib/string_calculator'

RSpec.describe 'StringCalculator' do
  before(:each) { StringCalculator.reset_call_count! }

  describe '.add' do
    it 'returns 0 for empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'returns number itself for a single number' do
      expect(StringCalculator.add("5")).to eq(5)
    end

    it 'returns the sum of two comma-separated numbers' do
      expect(StringCalculator.add("3,2")).to eq(5)
    end

    it 'returns sum of multiple numbers' do
      expect(StringCalculator.add("1,2,3")).to eq(6)
    end

    it 'supports newline as delimiter along with commas' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
      expect(StringCalculator.add("10\n20\n30")).to eq(60)
      expect(StringCalculator.add("1\n2\n3,4,5")).to eq(15)
    end

    # TEST_PLACEHOLDER
  end
end
