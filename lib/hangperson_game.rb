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
    raise ArgumentError if new_guess == nil || new_guess.length == 0 || !(/[[:alpha:]]/ === new_guess) 
    return unless new_guess.length == 1
    if (@word[new_guess]) 
      @guesses[new_guess]? false : @guesses << new_guess 
    else
      @wrong_guesses[new_guess] ? false : @wrong_guesses << new_guess 
    end 
  end

end
