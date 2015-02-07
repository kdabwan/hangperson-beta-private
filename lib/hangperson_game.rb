class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end

  attr_accessor :word, :guesses, :wrong_guesses
  def initialize(new_word)
  	@word = new_word
  	@guesses = ''
  	@wrong_guesses = ''
  end

  def guess(new_guess) 
    raise ArgumentError if new_guess == nil || !(/[A-Za-z]/ === new_guess) 
    new_guess = new_guess.downcase
    if (@word[new_guess]) 
      @guesses[new_guess]? false : @guesses << new_guess 
    else
      @wrong_guesses[new_guess] ? false : @wrong_guesses << new_guess 
    end 
  end

  def word_with_guesses
    return "-" * @word.length  if guesses.empty?
    result = ''
    @word.split(//).each {|char| @guesses[char]? result << char : result << "-"}
    return result
  end

  def check_win_or_lose
    return :lose if @wrong_guesses.length >= 7
    return :win if word_with_guesses == @word
    return :play
  end

end
