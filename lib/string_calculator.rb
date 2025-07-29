class StringCalculator
  @call_count = 0

  class << self
    attr_reader :call_count

    def add(input)
      @call_count += 1
      return 0 if input.strip.empty?
      return input.to_i if input.strip.length == 1
      delimiters = [",", "\n"]
      if input.start_with?("//")
        header, input = input.split("\n", 2)
        custom = header.scan(/\[(.+?)\]/).flatten
        custom = [header[2]] if custom.empty?
        delimiters.concat(custom)
      end
      numbers = input.split(Regexp.union(delimiters)).map(&:to_i)
      return numbers.sum
      # METHOD_PLACEHOLDER
    end

    def reset_call_count!
      @call_count = 0
    end
  end
end
