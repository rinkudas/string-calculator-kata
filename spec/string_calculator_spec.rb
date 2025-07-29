require_relative '../lib/string_calculator'

RSpec.describe 'StringCalculator' do
  before(:each) { StringCalculator.reset_call_count! }

  describe '.add' do
    it 'returns 0 for empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    # TEST_PLACEHOLDER
  end
end
