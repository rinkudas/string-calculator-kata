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

    it 'supports custom single-character delimiter' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
      expect(StringCalculator.add("//|\n4|5|6")).to eq(15)
      expect(StringCalculator.add("//x\n7x8x9")).to eq(24)
    end

    it 'raises error for single negative number' do
      expect { StringCalculator.add("-1") }.to raise_error("negatives not allowed: -1")
    end

    it 'raises error for multiple negative numbers' do
      expect { StringCalculator.add("2,-3") }.to raise_error("negatives not allowed: -3")
      expect { StringCalculator.add("-4,-5,6") }.to raise_error("negatives not allowed: -4,-5")
    end

    it 'tracks how many times add method has been called' do
      StringCalculator.add("1,2")
      StringCalculator.add("3")
      expect(StringCalculator.call_count).to eq(2)
    end

    it 'ignores numbers greater than 1000' do
      expect(StringCalculator.add("2,1001")).to eq(2)
    end

    # TEST_PLACEHOLDER
  end
end
