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

    # TEST_PLACEHOLDER
  end
end
