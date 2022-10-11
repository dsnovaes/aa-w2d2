class Hangman

  # attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  @@random_word = ""

  def self.random_word
    @@random_word = DICTIONARY.sample
  end

    def initialize()
      @secret_word = Hangman.random_word
      @guess_word = Array.new(@secret_word.length, "_")
      @attempted_chars = []
      @remaining_incorrect_guesses = 5
    end

    def guess_word
      @guess_word
    end

    def attempted_chars
      @attempted_chars
    end

    def remaining_incorrect_guesses
      @remaining_incorrect_guesses
    end

    def already_attempted?(char)
      @attempted_chars.include?(char)
    end

    def get_matching_indices(char)
      result = []
      @secret_word.each_char.with_index { |c,i| result << i if c == char }
      result
    end

    def fill_indices(char,arr)
      arr.each { |i| @guess_word[i] = char }
    end

end