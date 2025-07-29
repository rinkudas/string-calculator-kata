class StringCalculator
  @call_count = 0

  class << self
    attr_reader :call_count

    def add(input)
      @call_count += 1
      # METHOD_PLACEHOLDER
    end

    def reset_call_count!
      @call_count = 0
    end
  end
end
