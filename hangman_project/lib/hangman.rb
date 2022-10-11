class Hangman

  DICTIONARY = ["cat", "dog", "bootcamp", "pizza","green","courtain","ground","basement","united","elephant","table","door","window","bed","chair","phone","wallet","marble","bag", "victory","glass","wall","previous"]

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

    def try_guess(char)
      matching = get_matching_indices(char)
      fill_indices(char,matching)

      if already_attempted?(char)
        p "that has already been attempted"
        false
      else
        @attempted_chars << char
        @remaining_incorrect_guesses -= 1 if matching.empty?
        return true
      end
    end

    def ask_user_for_guess
      p "Enter a char:"
      char = gets.chomp.to_s
      try_guess(char)
    end

    def win?
      if @guess_word.join("") == @secret_word
        p "WIN"
        true
      else
        false
      end
    end

    def lose?
      if @remaining_incorrect_guesses == 0
        p "LOSE"
        true
      else
        false
      end
    end

    def game_over?
      if win? 
        p @secret_word
        true
      elsif lose?
        p "The word was " + @secret_word
        true
      else
        false
      end
    end

end